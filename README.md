# Counter Contract Foundry

Learing how to write smart contracts using foundry.

## Prerequisites

- [Rust](https://www.rust-lang.org/tools/install)
- [Install Foundry](https://book.getfoundry.sh/getting-started/installation)

## Useful Commands

- Build the contract

```bash
forge build
```

- Test the contract

```bash
forge test
```

- Deploying contract to anvil

```bash
forge create src/Counter.sol:Counter --private-key=<private-key-from-anvil>
```

- Deploying contract to anvil using deployment script

Add in the private key in the .env file

```bash
cp .env.example .env
```

```bash
forge script script/Counter.s.sol:CounterScript --fork-url http://localhost:8545 --broadcast
```

- Deploying contract to testnet

```bash
forge create --rpc-url <goerli-testnet-url> --private-key <private-key> src/Counter.sol:Counter --etherscan-api-key <etherscan-api-key> --verify
```

## Using `cast` to interact with the deployed contract

- getNumber()

```bash
cast call <contract-address> "getNumber()(uint256)"
```

- setNumber(uint256 number)

```bash
cast send <contract-address> "setNumber(uint256)" 4 --private-key=<private-key>
```
