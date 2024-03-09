const wallet = '0x426F990461C72f028c32F70ebf30208aCa24c067';
const { ethers, artifacts } = require("hardhat");

async function main() {
    // Dynamically fetch the ABI at runtime
    const MyToken = await ethers.getContractFactory("MyToken"); // Replace "MyToken" with the name of your contract
    const myToken = await MyToken.attach(wallet);

    // You can access the ABI via the deployed contract object
    const contractABI = MyToken.interface.format.abi;

    console.log(contractABI);
    console.log("hello");
    
    const [deployer] = await ethers.getSigners();
    const uri = "https://ipfs.io/ipfs/QmPjyATk9s5BsZMUD82eWYCEWGmuCXAQjarBirGMrH4eE5?filename=luxap_exam.json";
    await myToken.mintRealEstate(deployer.address, 1, uri, "0x");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
