// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC721A} from "erc721a/contracts/ERC721A.sol";

contract Fanding is ERC721A {
    address public immutable CUSD = 0xb3008E7156Ae2312b49B5200C3E1C3e80E529feb;

    constructor() ERC721A("Album", "ALBUM") {}

    function mint(uint256 quantity) external payable {
        _mint(msg.sender, quantity);
    }
}
