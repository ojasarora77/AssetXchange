import "@nomicfoundation/hardhat-toolbox";
import 'dotenv/config';
const config = {
  solidity: "0.8.19",
  networks: {
    etherlinkTest: {
      url: "https://node.ghostnet.etherlink.com",
      accounts: ['78d251b985e80e25a03ec52cd7212aa68d57bff31b9262a7fceb8ea047e96023'].filter(Boolean),
    }
  }
};

export default config;

