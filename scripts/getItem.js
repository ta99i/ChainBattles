const { ethers } = require("hardhat");
const PrintCharacter = async (_class, _item) => {
  console.log(
    "Class: " +
      _class.toString() +
      " Level: " +
      _item.level.toString() +
      " Speed: " +
      _item.speed.toString() +
      " Life: " +
      _item.life.toString() +
      " Mana: " +
      _item.mana.toString() +
      " Strength: " +
      _item.strength.toString() +
      " Mage: " +
      _item.mage.toString()
  );
};
const main = async () => {
  try {
    const NFTContractFactory = await ethers.getContractFactory("ChainBattles");
    const ContractFactory = await NFTContractFactory.attach(
      "0x9E9f4a7e3399e08A4BCb0eb0Bcf83fF6277FfD95"
    );
    const class1 = await ContractFactory.getClass(1);
    const item1 = await ContractFactory.getIteam(1);
    PrintCharacter(class1, item1);
  } catch (error) {}
};
main();
