require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

const { MY_PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.0",
  defaultNetwork: "hardhat",
  networks: {
    base: {
      url: "https://sepolia.base.org", 
      accounts: [`0x${MY_PRIVATE_KEY}`]
    }
  }
};
