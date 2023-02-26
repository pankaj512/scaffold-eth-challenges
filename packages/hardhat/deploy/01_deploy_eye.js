// deploy/01_deploy_staker.js

const { ethers } = require("hardhat");

const localChainId = "31337";

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();

  const EyeLibrary = await deployments.get("EyeLibrary");

  await deploy("Eye", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    libraries: {
      EyeLibrary: EyeLibrary.address,
    },
  });

  const Eye = await ethers.getContract("Eye");

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Eye.address,
        contractArguments: [],
        libraries: {
          EyeLibrary: EyeLibrary.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }
};

module.exports.tags = ["Eye"];
