const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const name = "MyToken";
  const symbol = "MTK";
  const initialSupply = hre.ethers.parseUnits("1000", 18); // 1000 tokens

  const token = await MyToken.deploy(name, symbol, initialSupply);
  await token.waitForDeployment();

  console.log("MyToken deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
