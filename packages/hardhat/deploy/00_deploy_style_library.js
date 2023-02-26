// deploy/00_deploy_example_external_contract.js

const { ethers } = require("hardhat");

const localChainId = "31337";

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();

  await deploy("StyleLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
  });

  const StyleLibrary = await ethers.getContract("StyleLibrary");

  // Verify your contracts with Etherscan You don't want to verify on localhost
  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: StyleLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }
};

// function sleep(ms) {
//   return new Promise((resolve) => setTimeout(resolve, ms));
// }

module.exports.tags = ["StyleLibrary"];
