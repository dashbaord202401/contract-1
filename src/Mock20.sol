// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Mock20 is ERC20 {
    constructor() ERC20("Mock", "MOCK") {}

    function faucet(uint256 value) public {
        _mint(msg.sender, value);
    }
}
