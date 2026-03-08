# 🌹 RoseNFT Collection

An ERC-721 NFT smart contract with paid minting, max supply cap, and IPFS metadata support. Deployed on Sepolia Testnet.

---

## 📋 Collection Details

| Property | Value |
|----------|-------|
| **Name** | RoseNFT |
| **Symbol** | RNFT |
| **Max Supply** | 100 NFTs |
| **Mint Price** | 0.01 ETH |
| **Network** | Sepolia Testnet |
| **Standard** | ERC-721 |

---

## 🛠️ Built With

- Solidity ^0.8.20
- OpenZeppelin ERC721URIStorage
- Remix IDE
- IPFS / Pinata (for metadata storage)

---

## ✨ Features

- ✅ ERC-721 standard (NFT)
- ✅ Max supply of 100 NFTs
- ✅ Paid public minting (0.01 ETH)
- ✅ Owner-only free mint for giveaways
- ✅ IPFS metadata support
- ✅ Owner can open/close minting
- ✅ ETH withdrawal by owner

---

## 📦 NFT Metadata Format (IPFS JSON)

Each NFT needs a metadata JSON file hosted on IPFS:

```json
{
  "name": "RoseNFT #1",
  "description": "A beautiful rose from the RoseNFT collection.",
  "image": "ipfs://YOUR_IMAGE_CID_HERE",
  "attributes": [
    { "trait_type": "Color", "value": "Red" },
    { "trait_type": "Rarity", "value": "Common" },
    { "trait_type": "Edition", "value": "Genesis" }
  ]
}
```

> Upload images and JSON to [Pinata](https://pinata.cloud) (free) to get IPFS URIs.

---

## 🚀 Deployment Steps

1. Open [Remix IDE](https://remix.ethereum.org)
2. Create `RoseNFT.sol` and paste the contract
3. Compile with Solidity 0.8.20
4. Deploy to Sepolia via MetaMask (Injected Provider)
5. Call `setMintingOpen(true)` to enable minting
6. Call `mint("ipfs://YOUR_METADATA_URI")` with 0.01 ETH

---

## 🔍 Key Functions

| Function | Who | Description |
|----------|-----|-------------|
| `mint(tokenURI)` | Anyone | Mint an NFT (costs 0.01 ETH) |
| `ownerMint(to, tokenURI)` | Owner | Free mint for giveaways |
| `setMintingOpen(bool)` | Owner | Open or close public minting |
| `withdraw()` | Owner | Withdraw collected ETH |
| `tokenURI(id)` | Anyone | Get metadata URI of an NFT |
| `totalMinted()` | Anyone | See how many NFTs are minted |
| `ownerOf(id)` | Anyone | See who owns an NFT |

---

## 📚 What I Learned

- ERC-721 standard vs ERC-20
- How NFT metadata works with IPFS
- How to upload assets to Pinata
- `payable` functions and ETH handling in Solidity
- `msg.value` and `require` for payment validation

---

## 📄 License

MIT
