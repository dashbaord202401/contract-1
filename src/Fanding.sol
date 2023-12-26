// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Fanding is Ownable, ERC1155 {
    constructor() Ownable(msg.sender) ERC1155("") {}

    string private _name = "Album";
    string private _symbol = "ALBUM";

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function setNameAndSymbol(
        string calldata _newName,
        string calldata _newSymbol
    ) external onlyOwner {
        _name = _newName;
        _symbol = _newSymbol;
    }
}
