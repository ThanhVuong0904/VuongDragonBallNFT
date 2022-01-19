// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

pragma solidity >=0.7.0 <0.9.0;
contract DragonBalls is ERC721 {
    using Strings for uint256;
    string public domain = 'http://miniswap.herokuapp.com/charactor/detail/';
    constructor(string memory name, string memory symbol) ERC721(name, symbol){
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
        require(_exists(tokenId), "Token id is not availble");
        return string(abi.encodePacked(domain, tokenId.toString()));
    }

    function createCharacter(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}