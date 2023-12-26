// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721A} from "erc721a/contracts/ERC721A.sol";

contract Fanding is Ownable, ERC721A {
    uint256 public price;
    string private _baseTokenURI;

    constructor() Ownable(msg.sender) ERC721A("Album", "ALBUM") {}

    function mint(uint256 quantity) external payable {
        pay(quantity);
        _safeMint(msg.sender, quantity);
    }

    function pay(uint256 quantity) private {
        (bool success, ) = owner().call{value: price * quantity}("");
        require(success, "Failed to send Ether");
    }

    function setPrice(uint256 _price) external onlyOwner {
        price = _price;
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
        return _ownershipOf(tokenId);
    }
}
