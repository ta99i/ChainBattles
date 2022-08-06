const { ethers } = require("hardhat");
const main = async () => {
  try {
    const nftContractFactory = await ethers.getContractFactory("ChainBattles");
    const contractFactory = await nftContractFactory.deploy();
    await contractFactory.deployed();
    console.log(contractFactory.address);
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};
main();
//0x9E9f4a7e3399e08A4BCb0eb0Bcf83fF6277FfD95
