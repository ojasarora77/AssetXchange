async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const FarcasterToken = await ethers.getContractFactory("FarcasterToken");
    const farcasterToken = await FarcasterToken.deploy("1000000000000000000000"); // 1,000 FCT for example
  
    console.log("FarcasterToken address:", farcasterToken.address);
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  