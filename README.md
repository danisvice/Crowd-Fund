# Deploy a Crowd Funding Smart Contract to Goerli TestNet with Foundry 🚀

## Prerequisites

Before you begin, ensure you have the following:

- Rust installed
- Foundry installed
- Solidity contract (e.g., `CrowdFunding.sol`)

## Useful Commands

Here are some useful commands to help you through the process:

### Build the Contract

```bash
forge build
```

### Test the Contract

```bash
forge test
```

### View Detailed Test Logs and Tracebacks

```bash
forge test -vvvv
```

### Generate Gas Report

```bash
forge test --gas-report
```

### Deploying to Anvil

To deploy the contract to Anvil using your private key:

```bash
forge create src/CrowdFunding.sol:CrowdFunding --private-key=<private-key-from-anvil>
```

### Deploying to Anvil using Deployment Script

Ensure you have an `.env` file with the `PRIVATE_KEY` of any Anvil account. Then:

```bash
cp .env.example .env
forge script script/CrowdFunding.s.sol --fork-url http://localhost:8545 --broadcast
```

## Interacting with the Deployed Contract on Anvil

After deploying the contract, retrieve the contract address from the output:

```bash
export CONTRACT_ADR=<contract-address>
```

Set variables for ease of use:

```bash
export CAMPAIGN_OWNER_PRIV_KEY=<private-key-of-first-account-in-anvil>
export CAMPAIGN_OWNER_ADDRESS=<address-of-first-account-in-anvil>
export CAMPAIGN_DONOR_PRIV_KEY=<private-key-of-first-account-in-anvil>
```

### Creating a Campaign

```bash
cast send $CONTRACT_ADR "createCampaign(address,string,string,uint256,uint256,string)" $CAMPAIGN_OWNER_ADDRESS "Campaign 1" "Campaign 1 Description" 10ether <current-epoch-time + 300> "https://i.kym-cdn.com/photos/images/newsfeed/002/205/307/1f7.jpg" --private-key=$CAMPAIGN_OWNER_PRIV_KEY
```

**Note:** To set the deadline, add the current Unix epoch time to the command and add 300 seconds to it.

### Get Campaign Details

```bash
cast call $CONTRACT_ADR "getCampaign(uint256)(address,string,string,uint256,uint256,uint256,string)" 0
```

### Contribute to a Campaign

```bash
cast send $CONTRACT_ADR "donateToCampaign(uint256)" 0 --value 10ether --private-key=$CAMPAIGN_DONOR_PRIV_KEY
```

### Withdraw Funds

```bash
cast send $CONTRACT_ADR "withdraw(uint256)" 0 --private-key=$CAMPAIGN_OWNER_PRIV_KEY
```

### Check Campaign Owner Balance

```bash
cast balance $CAMPAIGN_OWNER_ADDRESS
```

## Deploying to Goerli TestNet

Set the following variables:

```bash
export GOERLI_URL=<goerli-url-from-infura-or-alchemy>
export PRIVATE_KEY=<private-key-from-metamask>
export ETHERSCAN_KEY=<etherscan-api-key>
```

Deploy the contract to Goerli along with verification:

```bash
forge create --rpc-url $GOERLI_URL --private-key $PRIVATE_KEY src/CrowdFunding.sol:CrowdFunding --etherscan-api-key $ETHERSCAN_KEY --verify
```

## Interacting with the Contract on Goerli

You can use similar commands as above, replacing the contract address and adding `--rpc-url $GOERLI_URL` to the commands.

That's it! You're now equipped to deploy and interact with your Solidity contract on the Goerli TestNet using Foundry. Have fun experimenting and building on the blockchain!

---

**Disclaimer:** This guide is intended for educational purposes. Be sure to review the official documentation and terms of use for the services and tools mentioned.
