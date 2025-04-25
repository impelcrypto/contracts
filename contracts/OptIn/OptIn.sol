// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract ScoreOptIn is ERC721, Ownable {
    uint256 public _nextTokenId;

    constructor(
        address initialOwner
    ) ERC721("ScoreOptIn", "SOI") Ownable(initialOwner) {
        _nextTokenId = 1;
    }

    function optIn(address to) public returns (uint256) {
        require(balanceOf(to) == 0, "Recipient already owns an NFT");
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        return tokenId;
    }

    /**
     * @dev Override the _update function to block transfers
     * This makes the token non-transferable except during initial minting
     */
    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override returns (address) {
        address from = _ownerOf(tokenId);

        // Allow minting (when from is zero address) but block transfers
        if (from != address(0)) {
            revert("Token transfer is BLOCKED");
        }

        return super._update(to, tokenId, auth);
    }
}
