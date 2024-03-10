// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AssetType.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Asset is ERC721 {
    mapping (uint256 => string[]) assetData;
    mapping (uint256 => string) assetURI;

    event created(address asset);
    uint256 private tokenIdNo;

    uint256 private assetTypeToken;
    AssetType private assetType;

    constructor(uint256 token, address _assetTypeAddress, string memory assetName, string memory assetTicker) ERC721(assetName, assetTicker) {
        tokenIdNo = 0;
        assetTypeToken = token;
        assetType = AssetType(_assetTypeAddress);
        _mint(assetType.ownerOf(assetTypeToken), 0);
        emit created(address(this));
    }

    function createAsset(address account, string[] memory assetProperties, string memory URI) external returns (uint256) {
        require(assetType.checkAssetTypeOwner(msg.sender, assetTypeToken), "Only the owner of the asset type can create assets");
        
        tokenIdNo += 1;
        _mint(account,tokenIdNo);
        assetData[tokenIdNo] = assetProperties;
        assetURI[tokenIdNo] = URI;
        return tokenIdNo;
    }

    function updateAsset(uint256 token, string[] memory assetProperties, string memory URI) external {
        require(msg.sender == ownerOf(token), "Only the owner of the asset can update the asset");
        assetData[token] = assetProperties;
        assetURI[token] = URI;
    }

    function burnAsset(uint256 token) external {
        require(msg.sender == ownerOf(token), "Only the owner of the asset can burn the asset");
        _burn(token);
    }

    function getAssetData(uint256 token) public view returns(string[] memory){
        return assetData[token];
    }

    function getAssetTypeData(uint256 token) public view returns(string[] memory){
        return assetType.getAssetTypeData(token);
    }

    function tokenURI(uint256 token) public override view returns(string memory){
        return assetURI[token];
    }

    function getAssetTypeURI(uint256 token) public view returns(string memory){
        return assetType.tokenURI(token);
    }


}