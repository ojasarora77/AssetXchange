const { ethers } = require("hardhat");
async function callMyContract() {
  const MyContract = await ethers.getContractFactory("Counter");
  const contract = MyContract.attach(
    // The deployed contract address
    "0xD4D502bF38Fb667d06B184434295c9f66d486838"
  );
  const store = await contract.store(201);
  console.log("Original Value:", 201);
  await contract.increment();
  let finalResult = await contract.getter();
  console.log("Increment Result:", finalResult);
  await contract.increment();
  finalResult = await contract.getter();
  console.log("Increment Result:", finalResult);
  await contract.decrement();
  finalResult = await contract.getter();
  console.log("Decrement Result:", finalResult);
}
callMyContract().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});