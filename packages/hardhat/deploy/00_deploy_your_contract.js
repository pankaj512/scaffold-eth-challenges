// deploy/00_deploy_your_contract.js

const { ethers } = require("hardhat");

const localChainId = "31337";

// const sleep = (ms) =>
//   new Promise((r) =>
//     setTimeout(() => {
//       console.log(`waited for ${(ms / 1000).toFixed(3)} seconds`);
//       r();
//     }, ms)
//   );

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();

  // await deploy("Style", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const StyleLibraryAddress = await ethers.getContract("Style", deployer)
  //   .address;

  // await deploy("Body", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const BodyLibraryAddress = await ethers.getContract("Body", deployer).address;

  // await deploy("Eye", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const EyeLibraryAddress = await ethers.getContract("Eye", deployer).address;

  // await deploy("Head", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const HeadLibraryAddress = await ethers.getContract("Head", deployer).address;

  // await deploy("Neck", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const NeckLibraryAddress = await ethers.getContract("Neck", deployer).address;

  // await deploy("Perch", {
  //   // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
  //   from: deployer,
  //   // args: [ "Hello", ethers.utils.parseEther("1.5") ],
  //   log: true,
  //   waitConfirmations: 5,
  // });
  // const PerchLibraryAddress = await ethers.getContract("Perch", deployer)
  //   .address;

  await deploy("YourCollectible", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      Eye: "0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9",
      Head: "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9",
      Neck: "0x610178dA211FEF7D417bC0e6FeD39F05609AD788",
      Perch: "0x0165878A594ca255338adfa4d48449f69242Eb8F",
      Style: "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512",
      Body: "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0",
    },
  });

  // Getting a previously deployed contract
  // const YourCollectible = await ethers.getContract("YourCollectible", deployer);
  /*  await YourCollectible.setPurpose("Hello");
  
    // To take ownership of YourCollectible using the ownable library uncomment next line and add the 
    // address you want to be the owner. 
    
    await YourCollectible.transferOwnership(
      "ADDRESS_HERE"
    );

    //const YourCollectible = await ethers.getContractAt('YourCollectible', "0xaAC799eC2d00C013f1F11c37E654e59B0429DF6A") //<-- if you want to instantiate a version of a contract at a specific address!
  */

  /*
  //If you want to send value to an address from the deployer
  const deployerWallet = ethers.provider.getSigner()
  await deployerWallet.sendTransaction({
    to: "0x34aA3F359A9D614239015126635CE7732c18fDF3",
    value: ethers.utils.parseEther("0.001")
  })
  */

  /*
  //If you want to send some ETH to a contract on deploy (make your constructor payable!)
  const YourCollectible = await deploy("YourCollectible", [], {
  value: ethers.utils.parseEther("0.05")
  });
  */

  /*
  //If you want to link a library into your contract:
  // reference: https://github.com/austintgriffith/scaffold-eth/blob/using-libraries-example/packages/hardhat/scripts/deploy.js#L19
  const YourCollectible = await deploy("YourCollectible", [], {}, {
   LibraryName: **LibraryAddress**
  });
  */

  // Verify from the command line by running `yarn verify`

  // You can also Verify your contracts with Etherscan here...
  // You don't want to verify on localhost
  // try {
  //   if (chainId !== localChainId) {
  //     await run("verify:verify", {
  //       address: YourCollectible.address,
  //       contract: "contracts/YourCollectible.sol:YourCollectible",
  //       constructorArguments: [],
  //     });
  //   }
  // } catch (error) {
  //   console.error(error);
  // }
};
module.exports.tags = ["YourCollectible"];
