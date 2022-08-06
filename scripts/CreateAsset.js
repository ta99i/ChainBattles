const { ethers } = require("hardhat");
const main = async () => {
  try {
    const nftContractFactory = await ethers.getContractFactory("ChainBattles");
    const contractFactory = await nftContractFactory.attach(
      "0x9E9f4a7e3399e08A4BCb0eb0Bcf83fF6277FfD95"
    );
    console.log(contractFactory.address);
    await contractFactory.mint(1);
    process.exit(0);
  } catch (error) {
    console.log("error : ", error);
    process.exit(1);
  }
};
main();
//0x9E9f4a7e3399e08A4BCb0eb0Bcf83fF6277FfD95
