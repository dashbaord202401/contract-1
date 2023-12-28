// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC721A} from "erc721a/ERC721A.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

error InsufficientPayment();

contract Fanding is ERC721A, Ownable {
    uint256 public price = 1 ether;
    string public baseTokenURI;

    constructor(
        string memory name,
        string memory symbol
    ) ERC721A(name, symbol) Ownable(msg.sender) {}

    function purchase(uint256 quantity) external payable {
        if (msg.value < quantity * price) revert InsufficientPayment();

        _mint(msg.sender, quantity);
    }

    function setPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
    }

    function setBaseURI(string calldata baseURI) external onlyOwner {
        baseTokenURI = baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length != 0
                ? string(abi.encodePacked(baseURI, _toString(tokenId), ".json"))
                : "";
    }
}
