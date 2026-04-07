// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title NewsRegistry
 * @dev On-chain registry for decentralized articles and collectible entries.
 */
contract NewsRegistry is ERC721URIStorage, Ownable {
    uint256 public nextEntryId;
    
    struct Entry {
        address author;
        string contentHash; // Arweave or IPFS
        uint256 price;
        bool exists;
    }

    mapping(uint256 => Entry) public entries;

    event ArticlePublished(uint256 indexed id, address indexed author, string contentHash);

    constructor() ERC721("News Collectible", "NEWS") Ownable(msg.sender) {}

    /**
     * @dev Publishes a new article and makes it collectible.
     */
    function publish(string calldata _contentHash, uint256 _price) external {
        uint256 id = nextEntryId++;
        
        entries[id] = Entry({
            author: msg.sender,
            contentHash: _contentHash,
            price: _price,
            exists: true
        });

        _safeMint(msg.sender, id);
        _setTokenURI(id, _contentHash);
        
        emit ArticlePublished(id, msg.sender, _contentHash);
    }

    function collect(uint256 _id) external payable {
        Entry memory e = entries[_id];
        require(e.exists, "Article not found");
        require(msg.value >= e.price, "Insufficient payment");

        payable(e.author).transfer(msg.value);
        _safeMint(msg.sender, nextEntryId++); // Mint a "Collector's Edition"
    }
}
