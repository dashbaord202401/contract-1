// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC721AUpgradeable} from "erc721a-upgradeable/contracts/ERC721AUpgradeable.sol";

contract Album is ERC721AUpgradeable {
    string private _baseTokenURI;
    uint256 public ALBUM_PRICE;

    function initialize(
        string memory name_,
        string memory symbol_,
        string memory baseURI_,
        uint256 albumPrice_
    ) public initializerERC721A {
        __ERC721A_init(name_, symbol_);
        _baseTokenURI = baseURI_;
        ALBUM_PRICE = albumPrice_;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
}
