const hre = require("hardhat");

async function main() {
  const News = await hre.ethers.getContractFactory("NewsRegistry");
  const news = await News.deploy();

  await news.waitForDeployment();
  console.log("News Registry deployed to:", await news.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
