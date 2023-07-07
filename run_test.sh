# bitcoin.conf sets -daemon -regtest -fallbackfee
bitcoind
bitcoin-cli -getinfo

bitcoin-cli createwallet test1
bitcoin-cli createwallet test2
bitcoin-cli createwallet test3
bitcoin-cli createwallet trash

bitcoin-cli -rpcwallet=test1 listtransactions

bitcoin-cli -rpcwallet=test1 getnewaddress
# bcrt1qhzgcmn2wz4rrscw407mgh8r8g5zk44764q0s2a
bitcoin-cli -rpcwallet=test2 getnewaddress
# bcrt1qywlw8qwc8mjgn3r9lm80ujnq5679efw6u0c4s0
bitcoin-cli -rpcwallet=test3 getnewaddress
# bcrt1qqytc7rldhykq6s79kgk26pg5nqwg4fmh9npea9
bitcoin-cli -rpcwallet=trash getnewaddress
# bcrt1ql7pp0zy72740kvf5y8wlul58q408jukdncrkh9

bitcoin-cli -getinfo

bitcoin-cli generatetoaddress 1 bcrt1qhzgcmn2wz4rrscw407mgh8r8g5zk44764q0s2a
# 4e89c23e083b61a8db409fda68a33dc958bcbb9daad72367afdc2067a6109a61
bitcoin-cli generatetoaddress 1 bcrt1qywlw8qwc8mjgn3r9lm80ujnq5679efw6u0c4s0
# 03d1b741184e253e53ca063c6f08ef47b6c9b38b2164b165e75c06bd65f33f87
bitcoin-cli generatetoaddress 1 bcrt1qqytc7rldhykq6s79kgk26pg5nqwg4fmh9npea9
# 408286ac391771b1b292164812180f992ad8976351a698d99882b2a3b5db3ffe
bitcoin-cli generatetoaddress 100 bcrt1ql7pp0zy72740kvf5y8wlul58q408jukdncrkh9
# running generatetoaddress to `trash` is just to move blocks forward 
# so that balance shows up (finality) on other test addresses

bitcoin-cli -getinfo

bitcoin-cli -rpcwallet=test1 sendtoaddress bcrt1qywlw8qwc8mjgn3r9lm80ujnq5679efw6u0c4s0 1
bitcoin-cli -rpcwallet=test3 sendtoaddress bcrt1qywlw8qwc8mjgn3r9lm80ujnq5679efw6u0c4s0 1
bitcoin-cli generatetoaddress 100 bcrt1ql7pp0zy72740kvf5y8wlul58q408jukdncrkh9
# move blocks forward

bitcoin-cli -getinfo

bitcoin-cli stop


# example of load wallet (usually during resume)
bitcoin-cli loadwallet /home/ben/.bitcoin/regtest/wallets/test3
