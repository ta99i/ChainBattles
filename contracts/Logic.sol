// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract Logic {
    using Strings for uint256;

    mapping(uint256 => Character) public _tokenIdToCharacter;
    struct Character {
        Class class;
        uint256 level;
        uint256 speed;
        uint256 life;
        uint256 mana;
        uint256 strength;
        uint256 mage;
    }
    enum Class {
        Warrior,
        Wizzard,
        Rogue
    }

    function createCharacter(Class _class) internal returns (Character memory) {
        Character memory character;
        character.class = _class;
        character.level = 1;
        if (_class == Class.Warrior) {
            character.speed = 2;
            character.life = 200;
            character.mana = 100;
            character.strength = 50;
            character.mage = 10;
        } else if (_class == Class.Wizzard) {
            character.speed = 1;
            character.life = 120;
            character.mana = 200;
            character.strength = 10;
            character.mage = 50;
        } else {
            character.speed = 1;
            character.life = 120;
            character.mana = 200;
            character.strength = 40;
            character.mage = 20;
        }
        return character;
    }

    function getIteam(uint256 tokenId) public view returns (Character memory) {
        Character memory c = _tokenIdToCharacter[tokenId];
        return c;
    }

    function getClass(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 class = uint256(character.class);
        if (class == 0) return "Warrior";
        else if (class == 1) return "Wizzard";
        return "Rogue";
    }

    function getLevel(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 level = character.level;
        return level.toString();
    }

    function getSpeed(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 speed = character.speed;
        return speed.toString();
    }

    function getLife(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 life = character.life;
        return life.toString();
    }

    function getMana(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 mana = character.mana;
        return mana.toString();
    }

    function getStrength(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 strength = character.strength;
        return strength.toString();
    }

    function getMage(uint256 tokenId) public view returns (string memory) {
        Character memory character = _tokenIdToCharacter[tokenId];
        uint256 mage = character.mage;
        return mage.toString();
    }
}
