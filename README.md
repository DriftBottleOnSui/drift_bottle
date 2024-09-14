# Drift bottle on chain

- Is there something you've always wanted to say but never had the courage to? What are you afraid of? What’s holding you back? Send out a drift bottle and let out the words in your heart.
- Is there someone you can’t stop thinking about, someone you want to say something to but don’t dare? Write it down in a drift bottle, and maybe it will find its way to their heart…
- Has anyone ever told you, “I love you so much”...
- Are you feeling overwhelmed? Need a place to vent? Write down the worries in your heart and send them far away.
- Did you know? That year, I waited for you until the very end...

# Development
```
package: 0xf9e1810f194bf23b229638d87f5323ec045d20e8d2bd7d3383381f6970e17cb2
UserStatus: 0x99e28fd5fc45b1ee4cef2e04a7a61ad6c29f9cee5811d09f702f74ed7cdf8b85


sui client call --function publishStatus --package 0x419f741236dfd9cb6fa2199402f3fe0381975eb8e56e970f2adb459f7e625104 --module user_status --args 0xe1e8c48426760ae705ed69e80891a4deb5ac4931e9afd2d379a5700427970d43 '[5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG-cRM, 9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE]' '[0x38d0f836fae936fd28272cae04e7f9e18fbeef18714d4bf1c41703ac8ca397fd,0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223]'

sui client call --function createBottle --package 0x8d8d036f8bb13cca17e1e2593b3dc74fe1011325a91dc45f158c1820e8c21d1f --module social_bottle --args '[5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG, 9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE]' '[0x38d0f836fae936fd28272cae04e7f9e18fbeef18714d4bf1c41703ac8ca397fd, 0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223]' 0x6

sui client call --function openAndReplyBottle --package 0x85ed52bac0bc20a1f499a85935d844f089a8bb31bb47540c7375d7bd983b0493 --module social_bottle --args 0xf55004b13c8bc4d6f7ca2a5edbd8985124e7979b9fd8a3e49e90b253e3263e6c '[JVmbZRCGzXccKcFnA_cz-xZUi8QasEy_yMoojWPm3R4, JVmbZRCGzXccKcFnA_cz-xZUi8QasEy_yMoojWPm3R4]' '[0x9c6c6cd2a403353077a0d3236cdb173c9d60c61b6aec3500508a2a33c4aa210a,0x9c6c6cd2a403353077a0d3236cdb173c9d60c61b6aec3500508a2a33c4aa210a]' 0x6

-- v2
package: 0xd0bb9f2fb93d5d750a859758b8c75fcb3416bfc71dc8684912de35cd030912b7
UserStatus: 0xb39de8483e83b19adbfe3a838f6c583c9db61ec15ca24434a547c27f85b383a9

sui client call --function publishStatus --package 0xd0bb9f2fb93d5d750a859758b8c75fcb3416bfc71dc8684912de35cd030912b7 --module user_status --args 0xb39de8483e83b19adbfe3a838f6c583c9db61ec15ca24434a547c27f85b383a9 '[5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG-cRM3, 9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE3]' '[0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223, 0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223]'

sui client call --function becomeFriends --package 0xd0bb9f2fb93d5d750a859758b8c75fcb3416bfc71dc8684912de35cd030912b7 --module user_status --args 0x961d00737596a517b1b1e519b47bf0bf100c51fcb40427f197d14268ebd5a6ee 0xb39de8483e83b19adbfe3a838f6c583c9db61ec15ca24434a547c27f85b383a9


sui client call --function queryFriendStatus --package 0xd0bb9f2fb93d5d750a859758b8c75fcb3416bfc71dc8684912de35cd030912b7 --module user_status --args 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e 0xb39de8483e83b19adbfe3a838f6c583c9db61ec15ca24434a547c27f85b383a9
```