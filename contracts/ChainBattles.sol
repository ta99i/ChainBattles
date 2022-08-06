// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Logic.sol";

contract ChainBattles is ERC721URIStorage, Logic {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Chain Battles", " CBTLS") {}

    function generateSvg(uint256 tokenId) public returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">'
            "<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>"
            '<rect width="100%" height="100%" fill="black" />'
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">getClass(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Levels: getLevel(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Life: getLife(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Mana: getMana(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Speed: getSpeed(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Strength: getStrength(tokenId)</text>'
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Mage: getMage(tokenId)</text>'
            "</svg>"
        );
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml:Base64,",
                    Base64.encode(svg)
                )
            );
    }

    function getTokenURI(uint256 tokenId) public returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            "{",
            '"name": "Chain Battles #',
            tokenId.toString(),
            '",',
            '"description": "Battles on chain",',
            '"image": "',
            generateSvg(tokenId),
            '"',
            "}"
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }

    function train(uint256 tokenId) public {
        require(_exists(tokenId), "Please Use an exisiting Token");
        require(
            ownerOf(tokenId) == msg.sender,
            "You must own this token to train it"
        );
        Character memory character = _tokenIdToCharacter[tokenId];
        character.level += 1;
        character.life += 50;
        character.mana += 50;
        character.strength += 50;
        character.mage += 50;
        _tokenIdToCharacter[tokenId] = character;
        _setTokenURI(tokenId, getTokenURI(tokenId));
    }

    function mint(Class _class) public {
        uint256 class = uint256(_class);
        require(class < 3, "No Class");
        _tokenIds.increment();
        uint256 newItemnId = _tokenIds.current();
        _safeMint(msg.sender, newItemnId);
        _tokenIdToCharacter[newItemnId] = createCharacter(_class);
        _setTokenURI(newItemnId, getTokenURI(newItemnId));
    }
}
