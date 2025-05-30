// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract FlowerGrower is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    enum Stage { Seed, Sprout, Bud, Bloom }

    struct Flower {
        uint256 plantedAt;
        uint256 lastWateredAt;
        Stage stage;
    }

    mapping(uint256 => Flower) public flowers;
    uint256 public waterCooldown = 1 days;
    uint256 public stageDuration = 2 days;

    constructor() ERC721("OnChainFlower", "OCF") {}

    function plantFlower() external {
        uint256 newId = _tokenIds.current();
        _mint(msg.sender, newId);

        flowers[newId] = Flower({
            plantedAt: block.timestamp,
            lastWateredAt: block.timestamp,
            stage: Stage.Seed
        });

        _tokenIds.increment();
    }

    function waterFlower(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        Flower storage flower = flowers[tokenId];
        require(block.timestamp >= flower.lastWateredAt + waterCooldown, "Too early to water");

        flower.lastWateredAt = block.timestamp;

        uint256 timePassed = block.timestamp - flower.plantedAt;
        Stage newStage = Stage.Seed;
        if (timePassed >= 3 * stageDuration) {
            newStage = Stage.Bloom;
        } else if (timePassed >= 2 * stageDuration) {
            newStage = Stage.Bud;
        } else if (timePassed >= stageDuration) {
            newStage = Stage.Sprout;
        }

        flower.stage = newStage;
    }

    function getFlowerStage(uint256 tokenId) public view returns (Stage) {
        return flowers[tokenId].stage;
    }

    function setStageDuration(uint256 _duration) external onlyOwner {
        stageDuration = _duration;
    }

    function setWaterCooldown(uint256 _cooldown) external onlyOwner {
        waterCooldown = _cooldown;
    }
}
