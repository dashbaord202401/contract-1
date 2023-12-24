// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Album is ERC1155 {
    constructor() ERC1155("") {}

    /**
     * @dev TODO
     * - metadata
     * - mint
     * - CUSD
     * - ERC20Permit
     * - Gas Relay
     */
}
