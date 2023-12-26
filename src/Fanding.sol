// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Fanding is Ownable, ERC1155 {
    // Metadata storage
    string private _name = "Album";
    string private _symbol = "ALBUM";

    // Consturctor
    constructor() Ownable(msg.sender) ERC1155("") {}

    // Buy & Withdraw function
    function buyAlbum(uint256 id, uint256 quantity) public {
        _mint(msg.sender, id, quantity, "");
    }

    // Metadata function
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // Setting function
    function setTokenUri(string calldata newUri) external onlyOwner {
        _setURI(newUri);
    }
}
