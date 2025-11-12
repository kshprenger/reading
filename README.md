## Reading: Distributed Systems

### 🐲 Hydra book

- [A Science of Concurrent Programs](https://lamport.azurewebsites.net/tla/science.pdf)

---

### 🌐 General

- [Consistency models](https://jepsen.io/consistency)
- [Graph Theory](https://logic.pdmi.ras.ru/~dvk/graphs_dk.pdf)
- [Time, Clocks, and the Ordering of Events in a Distributed System](https://lamport.azurewebsites.net/pubs/time-clocks.pdf)
- [The Art of Multiprocessor Programming by Maurice Herlihy & Nir Shavit](https://github.com/amilajack/reading/blob/master/Computer_Science/The%20Art%20of%20Multiprocessor%20Programming.pdf)
- [Scalability! But at what COST?](https://www.usenix.org/system/files/conference/hotos15/hotos15-paper-mcsherry.pdf)
- [PACELS](https://uwaterloo.ca/distributed-algorithms-systems-lab/sites/default/files/uploads/files/proving_pacelc.pdf)
- [A distributed systems reliability glossary](https://antithesis.com/resources/reliability_glossary/)
- [Introduction to Reliable and Secure Distributed Programming](https://link.springer.com/book/10.1007/978-3-642-15260-3#overview)

---

### 🤝 Consensus (General)

- Paxos:
  - [The Part-Time Parliament](https://lamport.azurewebsites.net/pubs/lamport-paxos.pdf)
  - [Paxos Made Simple](https://lamport.azurewebsites.net/pubs/paxos-simple.pdf)
  - [Paxos Made Live](https://www.cs.utexas.edu/users/lorenzo/corsi/cs380d/papers/paper2-1.pdf)
  - [Paxosmon](https://vadosware.io/post/paxosmon-gotta-concensus-them-all/)
- Raft:
  - [In Search of an Understandable Consensus Algorithm(Extended Version)](https://raft.github.io/raft.pdf)
  - [Eli Bendersky - Implementing Raft](https://eli.thegreenplace.net/2020/implementing-raft-part-0-introduction/)
- [Heidi Howard - Paxos vs Raft: Have we reached consensus on distributed consensus?](https://youtu.be/0K6kt39wyH0?si=KyWtwr-w3g7vqG69)
- [Viewstamped Replication: A New Primary Copy Method to Support Highly-Available Distributed Systems](https://pmg.csail.mit.edu/papers/vr.pdf)
- [Protocol-Aware Recovery](https://www.usenix.org/system/files/conference/fast18/fast18-alagappan.pdf)

---

### 🗳️ Quorum systems

- [Flexible Paxos: Quorum intersection revisited](https://arxiv.org/abs/1608.06696)

---

### 💸 BFT & Crypto:

- [The Byzantine Generals](https://lamport.azurewebsites.net/pubs/the-byz-generals.pdf)
- [Bitcoin](https://bitcoin.org/bitcoin.pdf)
- TON:
  - [The Open Network (White paper)](https://docs.ton.org/ton.pdf)
  - [Telegram Open Network Blockchain](https://docs.ton.org/tblkch.pdf)
  - [Catchain Consensus: An Outline](https://docs.ton.org/catchain.pdf)
- Ethereum:
  - [Ethereum: A Next-Generation Smart Contract and Decentralized Application Platform (White paper)](https://ethereum.org/content/whitepaper/whitepaper-pdf/Ethereum_Whitepaper_-_Buterin_2014.pdf)
  - [ETHEREUM: A SECURE DECENTRALISED GENERALISED TRANSACTION LEDGER (Yellow paper)](https://ethereum.github.io/yellowpaper/paper.pdf)
- [Asynchronous Consensus without Trusted Setup or Public-KeyCryptography](https://eprint.iacr.org/2024/677.pdf)
- [Practical Byzantine Fault Tolerance](https://pmg.csail.mit.edu/papers/osdi99.pdf)
- [The Honey Badger of BFT Protocols](https://eprint.iacr.org/2016/199.pdf)
- [HotStuff: BFT Consensus in the Lens of Blockchain](https://arxiv.org/abs/1803.05069)
- [Tendermint: Consensus without Mining](https://tendermint.com/static/docs/tendermint.pdf)
- DAG-based blockchains
  - [DAG Meets BFT - The Next Generation of BFT Consensus](https://decentralizedthoughts.github.io/2022-06-28-DAG-meets-BFT/)
  - [DAG-Rider](https://arxiv.org/abs/2102.08325)
  - [Bullshark](https://arxiv.org/abs/2201.05677)
  - [Bullshark: The Partially Synchronous Version](https://arxiv.org/abs/2209.05633)
  - [Sparse Bullshark](todo)
  - [Narwhal and Tusk](https://arxiv.org/abs/2105.11827)
  - [Mysticeti: Reaching the Limits of Latency with Uncertified DAGs](https://arxiv.org/abs/2310.14821)
  - [Odontoceti: Ultra-Fast DAG Consensus with Two Round Commitment](https://arxiv.org/abs/2510.01216)

---

### 🕸️ P2P/Gossip/Infectioning

- [Kademlia: A Peer-to-peer Information System Based on the XOR Metric](https://pdos.csail.mit.edu/~petar/papers/maymounkov-kademlia-lncs.pdf)
- [BEPs](https://www.bittorrent.org/beps/bep_0000.html)
- [BitTorrent Spec V2](https://www.bittorrent.org/beps/bep_0052.html)
- [SWIM: Scalable Weakly-consistent Infection-style Process Group Membership Protocol](https://www.cs.cornell.edu/projects/Quicksilver/public_pdfs/SWIM.pdf)
- [Chord](https://pdos.csail.mit.edu/papers/chord:sigcomm01/chord_sigcomm.pdf)

---

### 💯 Transactions

- [Distributed Transaction Processing: The XA Specification](https://pubs.opengroup.org/onlinepubs/009680699/toc.pdf)
- [Two Phase Locking (2PL)](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/05/chapter3.pdf)
- [Calvin: Fast Distributed Transactions for Partitioned Database Systems](https://cs.yale.edu/homes/thomson/publications/calvin-sigmod12.pdf)
- [Maurice Herlihy — Transactional memory](https://youtu.be/EGlcl1rGj1E?si=gqhJJekdXqux0rwy)
- [The hitchhiker's guide to distributed transactions](https://youtu.be/sD5L5Utlq5g?si=GHlKolJ-ve8LH5rk)
- [Hermitage](https://github.com/ept/hermitage)

---

### 👥 CRDT

- [CRDTs: The hard parts](https://youtu.be/PMVBuMK_pJY?si=SJGG6rrkz_rRFLVV)
- [Automerge](https://github.com/automerge/automerge-classic)

---

### 🔬 Testing & Verification

- Simulations:
  - Matrix clock:
    - [Cambridge Press slides](https://www.cs.uic.edu/~ajayk/Chapter3.pdf)
    - [On reducing the complexity of matrix clocks](https://arxiv.org/abs/cs/0309042)
  - [TigerBeetle VOPR](https://tigerbeetle.com/blog/2023-07-11-we-put-a-distributed-database-in-the-browser)
  - [Testing Distributed Systems w/ Deterministic Simulation" by Will Wilson](https://youtu.be/4fFDFbi3toc?si=VT3fsqLI2XSOPfu6)
  - [Jepsen](https://jepsen.io/)
  - [Nucleus](https://dropbox.tech/infrastructure/-testing-our-new-sync-engine)
- TLA:
  - [TLA+](https://lamport.azurewebsites.net/tla/tla.html)
  - [Designing distributed systems with TLA+](https://youtu.be/2PIgZ6hd-6I?si=xXzjjl1-VrJvfU06)
- [Testing Distributed Systems](https://asatarin.github.io/testing-distributed-systems/)

---

### 🎛️ Scheduling

- [Large-scale cluster management at Google with Borg](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/43438.pdf)
- [Quincy: Fair Scheduling for Distributed Computing Clusters](https://www.sigops.org/s/conferences/sosp/2009/papers/isard-sosp09.pdf)

---

### ⚙️ Production

- Amazon:
  - [Dynamo: Amazon’s Highly Available Key-value Store](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)
- Apache:
  - [Cassandra - A Decentralized Structured Storage System](https://www.cs.cornell.edu/projects/ladis2009/papers/lakshman-ladis2009.pdf)
  - Kafka:
    - [Confluent blog](https://www.confluent.io/blog/)
    - [Kafka: a Distributed Messaging System for Log Processing](https://notes.stephenholiday.com/Kafka.pdf)
    - [Book](https://book.huihoo.com/pdf/confluent-kafka-definitive-guide-complete.pdf)
  - [ZooKeeper: A Distributed Coordination Service for Distributed](https://zookeeper.apache.org/doc/r3.2.2/zookeeperOver.pdf)
- Apple:
- [FoundationDB](https://www.foundationdb.org/files/fdb-paper.pdf)
- Google:
  - [Large-scale Incremental Processing Using Distributed Transactions and Notifications (Percolator)](https://storage.googleapis.com/gweb-research2023-media/pubtools/pdf/36726.pdf)
  - [Spanner: Google’s Globally-Distributed Database](https://research.google.com/archive/spanner-osdi2012.pdf)
  - [F1](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/41344.pdf)
  - [Bigtable: A Distributed Storage System for Structured Data](https://storage.googleapis.com/gweb-research2023-media/pubtools/pdf/68a74a85e1662fe02ff3967497f31fda7f32225c.pdf)
  - [The Chubby lock service for loosely-coupled distributed systems](https://research.google.com/archive/chubby-osdi06.pdf)
- Yandex:
  - [Распределенные транзакции в YDB / Семён Чечеринда (Яндекс)](https://youtu.be/8AR1u5OZIm8?si=PFz6sznlm2lLj_xc)
  - [YTsaurus](https://ytsaurus.tech/docs/en/)
  - [Просто о сложном как работает драйвер распределенной базы данных YDB / Алексей Мясников](https://youtu.be/bbdk2UGkWR8?si=63REowfjWR9gqqaP)
- Facebook:
  - [Virtual consensus in Delos](https://research.facebook.com/file/534538337798875/Virtual-Consensus-in-Delos.pdf)
  - [RocksDB](https://www.usenix.org/system/files/fast21-dong.pdf)
- [ETCD Key-Value](https://etcd.io/)

---

### 📜 Related Lists

- [Roman Lipovsky](https://gitlab.com/Lipovsky/awesome-distsys)
- [Heidi Howard](https://github.com/heidihoward/distributed-consensus-reading-list)

---

### 📰 Blog

- [Dmitry Vyukov 1024cores](https://www.1024cores.net/)
- [Asymmetric Transfer by Lewiss Baker](https://lewissbaker.github.io/)
- [TigerBeetle](https://tigerbeetle.com/blog)
- [Jepsen](https://jepsen.io/blog)
- [Eli Bendersky: Concurrency](https://eli.thegreenplace.net/tag/concurrency)

---

### 🌟 Conference

[CORE rankings](https://portal.core.edu.au/conf-ranks/)

- [Hydra](https://hydraconf.com/)
- [Systems Distributed](https://systemsdistributed.com/)
- [The Strange Loop](https://www.thestrangeloop.com/index.html)
- [BugBash](https://bugbash.antithesis.com/#about)
- [ICDCS](https://icdcs2025.icdcs.org)
- [PODC](https://www.podc.org)
- [DISK](https://www.disc-conference.org/wp/)

---

## Reading: Concurrency

### 🧰 Tools

- [Scalable Channel](https://arxiv.org/abs/2211.04986)
- [Nikita Koval — Synchronization primitives can be faster with SegmentQueueSynchronizer](https://youtu.be/2uxsNJ0TdIM?si=6V3TPxjHoXJlRXW6)

---

### 🧮 Transactional Memory

- [A Practical Multi-Word Compare-and-Swap Operation](https://www.cl.cam.ac.uk/research/srg/netos/papers/2002-casn.pdf)
- [Efficient Multi-word Compare and Swap](https://arxiv.org/abs/2008.02527)
- [Easy Lock-Free Indexing in Non-Volatile Memory](https://www2.cs.sfu.ca/~tzwang/pmwcas.pdf)

---

### 🔍 Model Checking

- [Dynamic Partial-Order Reduction for Model Checking Software](https://users.soe.ucsc.edu/~cormac/papers/popl05.pdf)
- [Truly Stateless, Optimal Dynamic Partial Order Reduction](https://plv.mpi-sws.org/genmc/popl2022-trust.pdf)
- [CDSCHECKER: Checking Concurrent Data Structures Written with C/C++ Atomics](http://demsky.eecs.uci.edu/publications/c11modelcheck.pdf)
- [Partial-Order Methods for the Verification of Concurrent Systems An Approach to the State-Explosion Problem](https://patricegodefroid.github.io/public_psfiles/thesis.pdf)
