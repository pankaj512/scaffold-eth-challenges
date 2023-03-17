// deploy/01_deploy_staker.js

const { ethers } = require("hardhat");

const localChainId = "31337";

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();

  const StyleLibrary = await deployments.get("StyleLibrary", deployer);
  const BodyLibrary = await deployments.get("BodyLibrary", deployer);
  // const Eye = await deployments.get("Eye", deployer);

  await deploy("YourCollectible", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [],
    log: true,
    libraries: {
      StyleLibrary: StyleLibrary.address,
      BodyLibrary: BodyLibrary.address,
    },
  });

  // Getting a previously deployed contract
  const YourCollectible = await ethers.getContract("YourCollectible", deployer);
  // await YourCollectible.addNft(Eye.address);

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: YourCollectible.address,
        contractArguments: [],
        libraries: {
          StyleLibrary: StyleLibrary.address,
          BodyLibrary: BodyLibrary.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }
};

module.exports.tags = ["YourCollectible"];
