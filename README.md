# Mythril Demo with Smart Contracts

This project takes a bunch of vulnerable smart contracts in order to be analyzed using `Mythril` the security analysis tool for smart contracts.

## Prerequisites

- Unix Command Shell - Linux of Mac (WSL for Windows)d.
- Python 3.8 and Packages:

  - python3-dev
  - virtual env

```bash
sudo apt install python3 python3-pip ipython3
sudo apt install python3-dev
sudo apt install virtualenv
```

- npm
- ganache

## Installing Mythril

1. Install Rust

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

This will cargo compiler to `.zshrc` or `.bashrc` so you must restart the terminal or use this command:

```shell
source "$HOME/.cargo/env"
```

2. Install Mythril

```shell
pip install mythril
```

### With Docker

If you are a docker user you can get Mythril with the following command:

```shell
$ docker pull mythril/myth
```

## Running Mythril

The Vulnerable Smart Contracts are on `contracts/VulnerableContracts` so you can use `myth analyze` and the Path for each one.

For example for the contract with Know Reentrancy Vulnerability yo can run

```bash
myth analyze contracts/VulnerableContracts/ReentrancyIssue.sol
```

This process may take from some seconds to several minutes, depending on your computer capabilities, so be patient.

### Special uses

The contract `SelfDestruct` needs at least 3 Transactions to be analyzed, so add `-t` flag to execution.

```shell
myth analyze contracts/VulnerableContracts/SelfDestruct.sol -t3
```

The contract `MetamorphicVulnerability.sol` uses a Open Zeppelin import, so you must add the npm package first and then run the code using `--solc-json` flag.

```bash
$ npm

myth analyze contracts/VulnerableContracts/MetamorphicVulnerability.sol --solc-json mythril-remappings
```

## Interesting Links

- Mythril official [Github](https://github.com/ConsenSys/mythril).
- [Swcregistry](https://swcregistry.io/) To know more about Vulnerabilities.
- [Chainlink](docs.chain.link) official docs, to learn more about truly random numbers.
