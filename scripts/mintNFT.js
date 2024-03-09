const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const myToken = await ethers.getContractAt("MyToken", "YOUR_CONTRACT_ADDRESS_HERE");

    const uri = "https://ipfs.io/ipfs/QmPjyATk9s5BsZMUD82eWYCEWGmuCXAQjarBirGMrH4eE5?filename=luxap_exam.json";
    await myToken.mintRealEstate(deployer.address, 1, uri, "0x");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
