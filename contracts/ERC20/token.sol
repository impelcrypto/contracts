// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TomatoToken is ERC20 {
    constructor() ERC20("TomatoToken", "TMT") {
        _mint(msg.sender, 10000 * 10 ** 18);
    }
}
