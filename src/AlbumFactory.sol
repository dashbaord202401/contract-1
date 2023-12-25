// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";
import {IAlbum} from "./interfaces/IAlbum.sol";

contract AlbumFactory {
    event ReleasedAlbum(address indexed);

    address immutable impl;

    constructor(address _impl) {
        impl = _impl;
    }

    function clone(string memory name) public returns (address) {}
}
