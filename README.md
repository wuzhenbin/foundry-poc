```shell
forge test --match-path ./test/Mock.sol  -vvv



forge test --match-path ./test/SumerMoney/Exploit.sol -vvv
forge test --match-path ./test/SumerMoney/ExploitV2.sol -vvv
forge test --match-path ./test/SumerMoney/Interact.sol -vvv

forge test --match-path ./test/Mars/Exploit.sol -vvv
forge test --match-path ./test/Mars/ExploitV3.sol -vvv
forge test --match-path ./test/Mars/Interact.sol -vvv
forge test --match-path ./test/Mars/Mock.sol -vvv

forge test --match-path ./test/Satx/Exploit.sol -vvv
forge test --match-path ./test/Satx/ExploitV2.sol -vvv
forge test --match-path ./test/Satx/ExploitV3.sol -vvv
forge test --match-path ./test/Satx/Interact.sol -vvv

forge test --match-path ./test/Chainge/Exploit.sol -vvv
forge test --match-path ./test/Chainge/Interact.sol -vvv

forge test --match-path ./test/HedgeyFinance/Exploit.sol -vvv
forge test --match-path ./test/HedgeyFinance/ExploitV2.sol -vvv
forge test --match-path ./test/HedgeyFinance/Interact.sol -vvv

forge test --match-path ./test/Fil314/ExploitV1.sol -vvv
forge test --match-path ./test/Fil314/ExploitV2.sol -vvv

# --evm-version 'cancun' or
# set evm_version = 'cancun'
forge test --match-path ./test/Grokd/Exploit.sol  -vvv

forge test --match-path ./test/Yield/Exploit.sol  -vvv

forge test --match-path ./test/Z123/ExploitV1.sol  -vvv
forge test --match-path ./test/Z123/Interact.sol  -vvv

# --evm-version 'cancun'
forge test --match-path ./test/Ngfs/Exploit.sol  -vvv
forge test --match-path ./test/Ngfs/Interact.sol  -vvv

forge test --match-path ./test/Ups/ExploitV1.sol  -vvv
forge test --match-path ./test/Ups/ExploitV2.sol  -vvv
forge test --match-path ./test/Ups/Interact.sol  -vvv

forge test --match-path ./test/XBridge/Exploit.sol  -vvv


forge test --match-path ./test/EgdFinance/Exploit.sol -vvv
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
