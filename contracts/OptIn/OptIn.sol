// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OptIn is ERC721, Ownable {
    uint256 private counter;

    constructor(
        address initialOwner
    ) ERC721("OptIn", "SOI") Ownable(initialOwner) {
        transferOwnership(initialOwner);
        counter = 0;
    }

    function optIn(address to) public onlyOwner {
        require(balanceOf(to) == 0, "Recipient already owns an NFT");
        counter++;
        _safeMint(to, counter);
    }

    function getCounter() public view returns (uint256) {
        return counter;
    }
}
