// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Fanding is Ownable, ERC1155 {
    // Metadata storage
    string private _name = "Album";
    string private _symbol = "ALBUM";

    // Price storage
    uint256 public price;

    // Defaut tokenId is `1`
    uint256 public constant ALBUM = 1;

    // Consturctor
    constructor() Ownable(msg.sender) ERC1155("") {}

    // Buy & Withdraw function
    function buyAlbum(uint256 quantity) public {
        _mint(msg.sender, ALBUM, quantity, "");
        (bool success, ) = owner().call{value: price * quantity}("");
        require(success, "Failed to send Ether");
    }

    function withdraw() external onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }

    // Metadata function
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // Setting function
    function setPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
    }

    function setTokenUri(string calldata newUri) external onlyOwner {
        _setURI(newUri);
    }

    function setNameAndSymbol(
        string calldata _newName,
        string calldata _newSymbol
    ) external onlyOwner {
        _name = _newName;
        _symbol = _newSymbol;
    }
}
