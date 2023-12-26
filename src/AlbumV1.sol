// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC721AUpgradeable} from "erc721a-upgradeable/contracts/ERC721AUpgradeable.sol";
import {IVRC25} from "./interfaces/IVRC25.sol";

contract AlbumV1 is ERC721AUpgradeable {
    IVRC25 public immutable CUSD =
        IVRC25(0xb3008E7156Ae2312b49B5200C3E1C3e80E529feb);
    string private _baseTokenURI;
    uint256 public ALBUM_PRICE;
    address artist;

    function initialize(
        string memory name_,
        string memory symbol_,
        string memory baseURI_,
        uint256 albumPrice_
    ) public initializerERC721A {
        __ERC721A_init(name_, symbol_);
        _baseTokenURI = baseURI_;
        ALBUM_PRICE = albumPrice_;
        artist = msg.sender;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    function mint(uint256 quantity) public {
        CUSD.transfer(artist, ALBUM_PRICE * quantity);
        _safeMint(msg.sender, quantity);
    }
}
