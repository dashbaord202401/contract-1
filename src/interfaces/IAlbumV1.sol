// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {IERC721A} from "erc721a/contracts/IERC721A.sol";

interface IAlbumV1 is IERC721A {
    function initialize(
        string memory name_,
        string memory symbol_,
        string memory baseURI_,
        uint256 albumPrice_
    ) external;
}
