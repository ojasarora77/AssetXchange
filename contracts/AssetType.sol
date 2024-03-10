// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./Asset.sol";

contract AssetType is ERC721 {
    event AssetCreated(address asset);

    mapping (uint256 => string[]) assetTypeData;
    mapping (uint256 => string) assetTypeURI;
    uint256 private tokenIdNo;

    constructor() ERC721("AssetXchange AssetType", "AXCT") {
        tokenIdNo = 0;
    }

    // Create a new type of asset
    function createAssetType(address account, string[] memory assetPropertyNames, string memory URI, string memory name, string memory ticker) external returns(Asset){
        tokenIdNo += 1;
        _mint(account, tokenIdNo);

        assetTypeData[tokenIdNo] = assetPropertyNames;
        assetTypeURI[tokenIdNo] = URI;

        Asset a = new Asset(tokenIdNo, address(this), name, ticker);
        emit AssetCreated(address(a));
        return a;
    }

    function checkAssetTypeOwner(address sender, uint256 assetType) public view returns(bool){
        return sender==ownerOf(assetType);
    }

    // Getter function for assetTypeData
    function getAssetTypeData(uint256 tokenId) public view returns (string[] memory) {
        return assetTypeData[tokenId];
    }

    function tokenURI(uint256 token) public override  view returns(string memory){
        return assetTypeURI[token];
    }
}