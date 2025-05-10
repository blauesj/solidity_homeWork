// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//0xb9Bc12a6A56230F98E59Fc09e5953092f0Eb75e8
contract MyNFT is ERC721{

    mapping(uint256 tokenId => string) private _tokenRri;
    constructor() ERC721("titimi","TMI"){

    }

    function mintNFT(string memory url,uint256 tokenId) public {
        _mint(msg.sender,tokenId);
        _tokenRri[tokenId] = url;
    }

    function tokenURI(uint256 tokenId) override public  view returns (string memory){
        return _tokenRri[tokenId];
    }            
}