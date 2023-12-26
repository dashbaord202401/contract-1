// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";
import {IAlbumV1} from "./interfaces/IAlbumV1.sol";

contract AlbumFactory {
    event ReleasedAlbum(address indexed);

    address immutable impl;

    constructor(address _impl) {
        impl = _impl;
    }

    function clone(
        string memory name_,
        string memory symbol_,
        string memory baseURI_,
        uint256 albumPrice_
    ) public returns (address) {
        address album = Clones.clone(impl);
        IAlbumV1(album).initialize(name_, symbol_, baseURI_, albumPrice_);
        emit ReleasedAlbum(album);
        return album;
    }
}
