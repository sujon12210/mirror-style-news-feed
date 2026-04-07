# Decentralized News Feed (Mirror-style)

A professional-grade implementation for decentralized media. This repository transforms articles into on-chain assets. By using permanent storage and NFT signatures, journalists can publish stories that cannot be deleted by central authorities, while fans can "Collect" entries to support the writers directly.

## Core Features
* **Writing Collectibles:** Authors can turn any article into a limited edition NFT (ERC-721).
* **Permanent Storage Integration:** Logic to link on-chain entries to Arweave or IPFS content hashes.
* **Curation Protocol:** A voting mechanism for a DAO to feature high-quality news on the main feed.
* **Flat Architecture:** Single-directory layout for the Entry Registry, Collector Module, and Curation logic.



## Logic Flow
1. **Publish:** Author writes an article, uploads it to Arweave, and registers the hash on-chain.
2. **Collect:** Readers buy "Entry NFTs" to support the author; funds go directly to the author's wallet.
3. **Curate:** Token holders vote on the most impactful news to boost its visibility in the feed.
4. **Resale:** If an entry NFT is resold, the author earns a secondary royalty (EIP-2981).

## Setup
1. `npm install`
2. Deploy `NewsRegistry.sol`.
