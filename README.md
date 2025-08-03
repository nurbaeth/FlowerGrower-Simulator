# 🌸 FlowerGrower Simulator    
     
A fully on-chain flower growing game built with Solidity. Plant, water, and grow your NFT flower as it progresses through life stages — from Seed to Bloom.   
     
---    
     
## ✨ Features  
      
- 🪴 **Plant Flowers:** Players can plant seeds to mint new NFTs.    
- 💧 **Watering Logic:** Water your flower every day to support its growth.     
- ⏳ **Time-Based Progression:** Flowers evolve through stages depending on time and care.  
- 🌼 **Stages of Growth:**
  - `Seed`  
  - `Sprout`  
  - `Bud` 
  - `Bloom`  
- 🔒 **Ownership Check:** Only the owner can water their flower.   
- ⚙️ **Admin Controls:** Owner can adjust growth speed and watering cooldown.  
  
---  
  
## 🧱 Smart Contract  
Written in Solidity `^0.8.20` and using OpenZeppelin standards:  
- `ERC721URIStorage`
- `Ownable`  
- `Counters`

---

## 🧪 Example Workflow
```solidity
plantFlower();
// Wait 1+ days
waterFlower(tokenId); // Stage: Sprout
// Wait more days and water again
// Stage: Bud → Bloom
```

---

## 🔧 Deployment
This contract can be deployed using [Hardhat](https://hardhat.org) or [Foundry](https://book.getfoundry.sh/):

```bash
# Install deps
npm install --save-dev hardhat @openzeppelin/contracts

# Compile
npx hardhat compile

# Deploy (you'll need your own deploy script)
npx hardhat run scripts/deploy.js --network yourNetwork
```

---

## 🧠 Ideas for Expansion
- 🌿 Visual metadata (on-chain SVGs or IPFS-hosted art)
- 🌈 Randomized traits (color, size, rarity)
- 🪙 In-game token rewards for active care
- 🧬 Breeding mechanic (combine two flowers)

---

## 📜 License
MIT — feel free to fork and grow your own on-chain garden 🌸
