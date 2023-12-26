// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Fanding is Ownable, ERC1155 {
    // Metadata storage
    string private _name = "Album";
    string private _symbol = "ALBUM";

    // Price storage
    uint256 public ALBUM_PRICE = 1 ether;

    // Consturctor
    constructor() Ownable(msg.sender) ERC1155("") {}

    // Buy & Withdraw function
    function buyAlbum(uint256 id, uint256 quantity) public payable {
        _mint(msg.sender, id, quantity, "");
        refundIfOver(ALBUM_PRICE * quantity);
    }

    function refundIfOver(uint256 price) private {
        require(msg.value >= price, "Need to send more ETH.");
        if (msg.value > price) {
            payable(msg.sender).transfer(msg.value - price);
        }
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
    function setTokenUri(string calldata newUri) external onlyOwner {
        _setURI(newUri);
    }
}
