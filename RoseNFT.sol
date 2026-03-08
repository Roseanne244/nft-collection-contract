// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title RoseNFT Collection
/// @author Roseanne Park
/// @notice ERC-721 NFT collection with minting, max supply, and metadata

contract RoseNFT is ERC721URIStorage, Ownable {

    uint256 public tokenCounter;
    uint256 public constant MAX_SUPPLY = 100;
    uint256 public constant MINT_PRICE = 0.01 ether;

    bool public isMintingOpen = false;

    event NFTMinted(address indexed minter, uint256 indexed tokenId, string tokenURI);

    constructor(address initialOwner)
        ERC721("RoseNFT", "RNFT")
        Ownable(initialOwner)
    {
        tokenCounter = 0;
    }

    /// @notice Owner can open or close minting
    function setMintingOpen(bool _open) public onlyOwner {
        isMintingOpen = _open;
    }

    /// @notice Mint a new NFT by paying MINT_PRICE
    /// @param tokenURI_ IPFS URI pointing to NFT metadata JSON
    function mint(string memory tokenURI_) public payable {
        require(isMintingOpen, "Minting is not open yet");
        require(msg.value >= MINT_PRICE, "Insufficient ETH sent");
        require(tokenCounter < MAX_SUPPLY, "Max supply reached");

        uint256 newTokenId = tokenCounter;
        tokenCounter++;

        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI_);

        emit NFTMinted(msg.sender, newTokenId, tokenURI_);
    }

    /// @notice Owner-only free mint (for giveaways)
    function ownerMint(address to, string memory tokenURI_) public onlyOwner {
        require(tokenCounter < MAX_SUPPLY, "Max supply reached");

        uint256 newTokenId = tokenCounter;
        tokenCounter++;

        _safeMint(to, newTokenId);
        _setTokenURI(to, tokenURI_);
    }

    /// @notice Withdraw ETH collected from minting
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        payable(owner()).transfer(balance);
    }

    /// @notice Total NFTs minted so far
    function totalMinted() public view returns (uint256) {
        return tokenCounter;
    }
}
