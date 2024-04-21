```shell
forge test --match-path ./test/EgdFinance/exploit.sol -vvv

forge test --match-path ./test/SumerMoney/exploit.sol -vvv
forge test --match-path ./test/SumerMoney/exploit-v2.sol -vvv
forge test --match-path ./test/SumerMoney/interact.sol -vvv

forge test --match-path ./test/Mars/exploit.sol -vvv
forge test --match-path ./test/Mars/exploit-v3.sol -vvv
forge test --match-path ./test/Mars/interact.sol -vvv
forge test --match-path ./test/Mars/mock.sol -vvv

forge test --match-path ./test/Satx/exploit.sol -vvv
forge test --match-path ./test/Satx/exploit-v2.sol -vvv
forge test --match-path ./test/Satx/exploit-v3.sol -vvv
forge test --match-path ./test/Satx/interact.sol -vvv

forge test --match-path ./test/Chainge/exploit.sol -vvv
forge test --match-path ./test/Chainge/interact.sol -vvv
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
