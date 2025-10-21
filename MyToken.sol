// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title MyToken - simple mintable ERC20 for Base
contract MyToken is ERC20, Ownable {
    constructor(string memory name_, string memory symbol_, uint256 initialSupply) ERC20(name_, symbol_) {
        if (initialSupply > 0) {
            _mint(msg.sender, initialSupply);
        }
    }

    /// @notice Mint tokens to an address (only owner)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
