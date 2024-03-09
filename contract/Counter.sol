// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;
contract Counter{
    uint number; 
    function store (uint num) public{
        number = num;
    }
    function increment () public{
        number++;
    }
    function decrement () public {
        number--;
    }
    function getter () public view returns (uint256) {
        return number; 
    }
}