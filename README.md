# Drift bottle on chain

- Is there something you've always wanted to say but never had the courage to? What are you afraid of? What’s holding you back? Send out a drift bottle and let out the words in your heart.
- Is there someone you can’t stop thinking about, someone you want to say something to but don’t dare? Write it down in a drift bottle, and maybe it will find its way to their heart…
- Has anyone ever told you, “I love you so much”...
- Are you feeling overwhelmed? Need a place to vent? Write down the worries in your heart and send them far away.
- Did you know? That year, I waited for you until the very end...

# Development
```
testnet package: 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7


sui client call --function createBottle --package 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7 --module drift_bottle --args "5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG-cRM" 0x38d0f836fae936fd28272cae04e7f9e18fbeef18714d4bf1c41703ac8ca397fd 0x6

Transaction Digest: 68NSezMHK3U1raFFduhAenpptKXZLzbRUb76VDPaR8rP
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: 68NSezMHK3U1raFFduhAenpptKXZLzbRUb76VDPaR8rP:0                                                  │
│  │ PackageID: 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7                            │
│  │ Transaction Module: drift_bottle                                                                         │
│  │ Sender: 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e                               │
│  │ EventType: 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7::drift_bottle::BottleEvent │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────────┬────────────────────────────────────────────────────────────────────┐                   │
│  │   │ action_type │ create                                                             │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ bottle_id   │ 0x7347645b7f5be9a68826bf08d37e256176c3f57d9b364ba35f953b457358ed61 │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ from        │ 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ to          │                                                                    │                   │
│  │   └─────────────┴────────────────────────────────────────────────────────────────────┘                   │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


sui client call --function openAndReplyBottle --package 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7 --module drift_bottle --args 0x7347645b7f5be9a68826bf08d37e256176c3f57d9b364ba35f953b457358ed61 "9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE" 0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223 0x6

Transaction Digest: HkZopiHFT8WJcBJfJaNFoSdP3QHQsuLihy41EFqdyuWR
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: HkZopiHFT8WJcBJfJaNFoSdP3QHQsuLihy41EFqdyuWR:0                                                  │
│  │ PackageID: 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7                            │
│  │ Transaction Module: drift_bottle                                                                         │
│  │ Sender: 0xc4301a727914c051c987331f30d002ef907f6f6e4badfec8981e6275ed22486c                               │
│  │ EventType: 0x3b40d2a1fc18cfc485ca14bbf30a8bebb2c1913ed6fc05299ea30afeeeb99bf7::drift_bottle::BottleEvent │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────────┬────────────────────────────────────────────────────────────────────┐                   │
│  │   │ action_type │ reply                                                              │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ bottle_id   │ 0x7347645b7f5be9a68826bf08d37e256176c3f57d9b364ba35f953b457358ed61 │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ from        │ 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e │                   │
│  │   ├─────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ to          │ 0xc4301a727914c051c987331f30d002ef907f6f6e4badfec8981e6275ed22486c │                   │
│  │   └─────────────┴────────────────────────────────────────────────────────────────────┘                   │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```