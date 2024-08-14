# Crowdfunding Smart Contract

This is a simple Ethereum-based crowdfunding smart contract written in Solidity. It allows multiple users to contribute funds towards a specific financial goal. If the goal is reached, the funds are transferred to a beneficiary. If the goal is not reached and the crowdfunding campaign is closed, contributors can withdraw their funds.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Contract Details](#contract-details)
- [Getting Started](#getting-started)
- [Functions](#functions)
- [Usage](#usage)
- [License](#license)

## Overview

This contract allows users to contribute Ether towards a specific funding goal. The contract owner sets a beneficiary and a funding goal. If the goal is met, the beneficiary can withdraw the funds. If the goal is not met, contributors can request a refund after the crowdfunding campaign is closed.

## Features

- **Contribution:** Users can contribute any amount of Ether to the campaign.
- **Goal Checking:** The contract tracks the total contributions and checks if the goal is reached.
- **Crowdsale Closure:** The crowdsale can be closed manually by the contract owner.
- **Refunds:** Contributors can request a refund if the funding goal is not met.

## Contract Details

- **Solidity Version:** ^0.8.0
- **License:** MIT

### State Variables

- `address payable public beneficiary`: The address that will receive the funds if the goal is reached.
- `uint public goal`: The target amount of Ether to be raised.
- `uint public amountRaised`: The total amount of Ether raised so far.
- `mapping(address => uint) public contributions`: A record of contributions made by each address.
- `bool public fundingGoalReached`: A flag that indicates whether the funding goal has been reached.
- `bool public crowdsaleClosed`: A flag that indicates whether the crowdsale has been closed.

## Getting Started

### Prerequisites

- **Solidity Compiler:** You can compile the contract using [Remix](https://remix.ethereum.org/), [Truffle](https://www.trufflesuite.com/), or any Solidity-compatible environment.
- **Ethereum Wallet:** You'll need an Ethereum wallet like [MetaMask](https://metamask.io/) to deploy and interact with the contract.

### Deployment

1. Compile the contract using a Solidity compiler.
2. Deploy the contract to the Ethereum network or a test network (e.g., Ropsten, Rinkeby) with the following parameters:
   - `address payable _beneficiary`: The address to receive the funds if the goal is met.
   - `uint _goal`: The amount of Ether to be raised.

## Functions

### `contribute()`
Allows users to contribute Ether to the crowdfunding campaign.

- **Conditions:**
  - The crowdsale must be open.
  - The contribution must be greater than 0.
- **Effects:**
  - Adds the contribution to the total amount raised.
  - Updates the contributor's balance.
  - Emits a `ContributionReceived` event.

### `checkGoalReached()`
Transfers the total amount raised to the beneficiary if the funding goal is met and the crowdsale is closed.

- **Conditions:**
  - The crowdsale must be closed.
  - The funding goal must be reached.

### `closeCrowdsale()`
Closes the crowdsale, preventing further contributions.

- **Conditions:**
  - The crowdsale must not already be closed.

### `refund()`
Allows contributors to withdraw their funds if the funding goal was not reached and the crowdsale is closed.

- **Conditions:**
  - The crowdsale must be closed.
  - The funding goal must not be reached.
  - The contributor must have a balance greater than 0.

## Usage

### Contributing to the Crowdfunding Campaign

1. Call the `contribute()` function and send the desired amount of Ether.
2. Check the `amountRaised` and `fundingGoalReached` variables to monitor the campaign's progress.

### Closing the Crowdsale

1. The contract owner can call the `closeCrowdsale()` function to close the campaign.
2. If the funding goal is reached, the owner can call `checkGoalReached()` to transfer the funds to the beneficiary.

### Requesting a Refund

1. If the funding goal is not reached and the crowdsale is closed, contributors can call the `refund()` function to withdraw their contributions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
