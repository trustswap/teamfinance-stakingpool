# TrustSwap StakingPool

## Overview
Smart contract for staking tokens and earning rewards. This contract allows users to stake tokens and claim rewards based on the staked amount and duration. 
This also allows adding new staking pools, updating pool parameters, depositing and withdrawing tokens, and claiming rewards.

## Features
- Staking tokens to earn rewards.
- Support for multiple staking pools.
- Non-reentrancy for secure deposits, withdrawals, and reward claims.
- Emergency withdrawal functionality.


### Prerequisites
Make sure you are equipped with the following:
  - foundry (see https://book.getfoundry.sh/getting-started/installation)

Clone `sample.env` file and rename to `.env`. Edit the ENV vars accordingly.

## Build
run
```sh
forge build
```

### Run testcases

run test cases with foundry
```sh
forge test -vvv
```

### Deployment

> Attention: ALWAYS use a hardware wallet OR at least an encrypted keystore file. The private key should never be stored in plain text or copy-pasted at any time!!!

```sh
forge script script/deployStakingPoolProxy.s.sol --broadcast --verify  --verifier sourcify -vvv --account <KEYSTORE_FILE> -f <NETWORK>
```

DO NOT FORGET TO CALL `initializePoolV2()` when deploying manually!  