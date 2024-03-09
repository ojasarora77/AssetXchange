const { ethers } = require("hardhat");

async function main() {
  // Retrieve the compiled contract using the contract's name.
  const MyToken = await ethers.getContractFactory("MyToken");

  // Deploy the contract.
  const myToken = await MyToken.deploy("https://my.api.com/{id}.json"); // Replace with your metadata URI

  // Wait for the contract to be deployed.
  await myToken.deployed();

  console.log(`MyToken deployed to: ${myToken.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
