#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

BATCH_SIZE=20
readme="README.md"
tmpdir=$(mktemp -d)
trap "rm -rf $tmpdir" EXIT

# Extract all URLs from markdown links [text](url)
urls=()
while IFS= read -r line; do
    urls+=("$line")
done < <(grep -oE '\[([^]]+)\]\(([^)]+)\)' "$readme" | grep -oE 'https?://[^)]+')

total=${#urls[@]}

check_url() {
    local url="$1"
    local out="$2"
    local status
    status=$(curl -o /dev/null -s -w "%{http_code}" -L --max-time 15 -A "Mozilla/5.0" "$url" 2>/dev/null)

    if [ "$status" -ge 200 ] 2>/dev/null && [ "$status" -lt 400 ] 2>/dev/null; then
        echo "ok|${GREEN}✓${NC} [$status] $url" > "$out"
    elif [ "$status" -eq 403 ] 2>/dev/null || [ "$status" -eq 429 ] 2>/dev/null; then
        echo "warn|${YELLOW}⚠${NC} [$status] $url (may be rate-limited or access restricted)" > "$out"
    elif [ "$status" = "000" ]; then
        echo "err|${RED}✗${NC} [TIMEOUT/DNS] $url" > "$out"
    else
        echo "err|${RED}✗${NC} [$status] $url" > "$out"
    fi
}

errors=0
warnings=0
ok=0

for ((i = 0; i < total; i += BATCH_SIZE)); do
    pids=()
    batch_end=$((i + BATCH_SIZE))
    if [ "$batch_end" -gt "$total" ]; then
        batch_end=$total
    fi

    for ((j = i; j < batch_end; j++)); do
        check_url "${urls[$j]}" "$tmpdir/$j" &
        pids+=($!)
    done

    for pid in "${pids[@]}"; do
        wait "$pid"
    done

    for ((j = i; j < batch_end; j++)); do
        line=$(cat "$tmpdir/$j")
        kind="${line%%|*}"
        msg="${line#*|}"
        echo -e "$msg"
        case "$kind" in
            ok)   ok=$((ok + 1)) ;;
            warn) warnings=$((warnings + 1)) ;;
            err)  errors=$((errors + 1)) ;;
        esac
    done
done

echo ""
echo "===== Summary ====="
echo -e "Total:    $total"
echo -e "${GREEN}OK:       $ok${NC}"
echo -e "${YELLOW}Warnings: $warnings${NC}"
echo -e "${RED}Errors:   $errors${NC}"

if [ "$errors" -gt 0 ]; then
    exit 1
fi
