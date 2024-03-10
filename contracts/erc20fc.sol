// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FarcasterToken is ERC20, Ownable {
    // Address of the DEX router (e.g., Uniswap V2 Router)
    address public dexRouterAddress;

    constructor(uint256 initialSupply, address _dexRouterAddress) 
        ERC20("FarcasterToken", "FCT") 
    {
        _mint(msg.sender, initialSupply); // Mint the initial supply to contract deployer
        dexRouterAddress = _dexRouterAddress;
    }

    // Allows the contract to receive tokens. You can remove it if not necessary.
    receive() external payable {}

    // Function to deposit tokens into this contract. Users call this to send their tokens to the contract.
    function depositTokens(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        transferFrom(msg.sender, address(this), amount);
    }

    // Function to approve DEX router to spend tokens held by this contract
    function approveTokenOnDex(uint256 amount) public onlyOwner {
        _approve(address(this), dexRouterAddress, amount);
    }

    // Function to change the DEX router address
    function setDexRouterAddress(address _newDexRouterAddress) public onlyOwner {
        dexRouterAddress = _newDexRouterAddress;
    }
}
