// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MyToken is ERC1155 {
    constructor() ERC1155("https://my.api.com/{id}.json") {
        _mint(msg.sender, 1, 10**18, "");
        _mint(msg.sender, 2, 1, "");
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
    {
        require(msg.sender == account, "ERC1155: Caller is not the owner");
        _mint(account, id, amount, data);
    }

    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account, "ERC1155: Caller is not the owner");
        _burn(account, id, amount);
    }
}
