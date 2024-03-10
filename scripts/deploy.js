const { ethers } = require("hardhat");

async function main() {
    // Deploying the contract
    const MyToken = await ethers.getContractFactory("MyToken"); // Replace "MyToken" with the name of your contract
    const myToken = await MyToken.deploy();
    //await myToken.deployed(); //does not work on hardhat?

    console.log("Contract deployed to address:", myToken.address);


    return myToken;
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});
