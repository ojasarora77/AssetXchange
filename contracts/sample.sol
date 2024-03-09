// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyToken is ERC1155, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    mapping(uint256 => string) private tokenURIs;

    constructor() ERC1155("https://ipfs.io/ipfs/QmPjyATk9s5BsZMUD82eWYCEWGmuCXAQjarBirGMrH4eE5?filename=luxap_exam.json") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
        // Optionally mint initial tokens here if needed
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data) public {
        require(hasRole(MINTER_ROLE, msg.sender), "MyToken: must have minter role to mint");
        _mint(account, id, amount, data);
    }

    function burn(address account, uint256 id, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender) || account == msg.sender, "MyToken: must have minter role or be the token owner to burn");
        _burn(account, id, amount);
    }

    function setTokenURI(uint256 tokenId, string memory newURI) public {
        require(hasRole(MINTER_ROLE, msg.sender), "MyToken: must have minter role to set URI");
        tokenURIs[tokenId] = newURI;
    }

    function uri(uint256 tokenId) public view override returns (string memory) {
        require(bytes(tokenURIs[tokenId]).length > 0, "MyToken: URI not set");
        return tokenURIs[tokenId];
    }

    function mintRealEstate(address account, uint256 id, string memory tokenURI, bytes memory data) public {
        require(hasRole(MINTER_ROLE, msg.sender), "MyToken: must have minter role to mint");
        setTokenURI(id, tokenURI); // Associate the token ID with its IPFS URI
        _mint(account, id, 1, data); // Mint exactly one unit to signify an NFT
    }
}
