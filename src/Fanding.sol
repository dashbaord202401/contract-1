// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721A} from "erc721a/contracts/ERC721A.sol";

contract Fanding is Ownable, ERC721A {
    uint256 private _price;
    string private _baseTokenURI;

    constructor() Ownable(msg.sender) ERC721A("Album", "ALBUM") {}

    function mint(uint256 quantity) external payable {
        _mint(msg.sender, quantity);
    }

    function price() internal view returns (uint256 memory) {
        return _price;
    }

    function setPrice(uint256 calldata price) external onlyOwner {
        _price = price;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string calldata baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function getOwnershipData(
        uint256 tokenId
    ) external view returns (TokenOwnership memory) {
        return ownershipOf(tokenId);
    }
}
