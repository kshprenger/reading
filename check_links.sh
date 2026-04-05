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

# Domains with strict Cloudflare JS challenges that no CLI tool can bypass
BOT_PROTECTED_DOMAINS="dl.acm.org"

is_bot_protected() {
    local url="$1"
    local domain
    domain=$(echo "$url" | sed -E 's|https?://([^/]+).*|\1|')
    for d in $BOT_PROTECTED_DOMAINS; do
        if [ "$domain" = "$d" ]; then
            return 0
        fi
    done
    return 1
}

# Node.js fallback — different TLS fingerprint bypasses some bot protection
NODE=$(which node 2>/dev/null)
node_check() {
    local url="$1"
    [ -z "$NODE" ] && return 1
    local status
    status=$("$NODE" -e "
        fetch('$url', {
            headers: { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36' },
            redirect: 'follow',
            signal: AbortSignal.timeout(15000)
        }).then(r => console.log(r.status)).catch(() => console.log('ERR'))
    " 2>/dev/null)
    [ "$status" -ge 200 ] 2>/dev/null && [ "$status" -lt 400 ] 2>/dev/null
}

check_url() {
    local url="$1"
    local out="$2"
    local status
    local ua="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

    status=$(curl -o /dev/null -s -w "%{http_code}" -L --max-time 15 \
        -A "$ua" \
        -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
        "$url" 2>/dev/null)

    # If curl gets blocked, retry with wget then node (different TLS fingerprints)
    if [ "$status" -eq 400 ] 2>/dev/null || [ "$status" -eq 403 ] 2>/dev/null || \
       [ "$status" -eq 429 ] 2>/dev/null || [ "$status" -eq 503 ] 2>/dev/null; then
        if wget -q -O /dev/null -T 15 --user-agent="$ua" "$url" 2>/dev/null; then
            status=200
        elif node_check "$url"; then
            status=200
        elif is_bot_protected "$url"; then
            echo "ok|${GREEN}✓${NC} [$status] $url (bot-protected, server alive)" > "$out"
            return
        fi
    fi

    if [ "$status" -ge 200 ] 2>/dev/null && [ "$status" -lt 400 ] 2>/dev/null; then
        echo "ok|${GREEN}✓${NC} [$status] $url" > "$out"
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
