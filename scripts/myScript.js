const { ethers } = require("hardhat");
async function deployMyContract() {
  const deployedContract = await ethers.deployContract("Counter");
  console.log("Contract Address: ", deployedContract.target);
  await deployedContract.waitForDeployment();
}
deployMyContract().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});