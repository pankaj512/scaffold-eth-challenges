// deploy/00_deploy_your_contract.js

const { ethers } = require("hardhat");

const localChainId = "31337";

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();

  await deploy("EyeLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("HeadLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("NeckLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("PerchLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("Perch2Library", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("BackgroundLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("Background2Library", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("StyleLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  await deploy("BodyLibrary", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
  });

  const EyeLibrary = await ethers.getContract("EyeLibrary", deployer);
  const HeadLibrary = await ethers.getContract("HeadLibrary", deployer);
  const NeckLibrary = await ethers.getContract("NeckLibrary", deployer);
  const PerchLibrary = await ethers.getContract("PerchLibrary", deployer);
  const Perch2Library = await ethers.getContract("Perch2Library", deployer);
  const BackgroundLibrary = await ethers.getContract(
    "BackgroundLibrary",
    deployer
  );
  const Background2Library = await ethers.getContract(
    "Background2Library",
    deployer
  );
  const StyleLibrary = await ethers.getContract("StyleLibrary", deployer);
  const BodyLibrary = await ethers.getContract("BodyLibrary", deployer);

  const Eye = await deploy("Eye", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      EyeLibrary: EyeLibrary.address,
    },
  });

  const Head = await deploy("Head", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      HeadLibrary: HeadLibrary.address,
    },
  });

  const Neck = await deploy("Neck", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      NeckLibrary: NeckLibrary.address,
    },
  });

  const Perch = await deploy("Perch", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      PerchLibrary: PerchLibrary.address,
      Perch2Library: Perch2Library.address,
    },
  });

  const Background = await deploy("Background", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [ "Hello", ethers.utils.parseEther("1.5") ],
    log: true,
    waitConfirmations: 5,
    libraries: {
      BackgroundLibrary: BackgroundLibrary.address,
      Background2Library: Background2Library.address,
    },
  });

  await deploy("YourCollectible", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [],
    log: true,
    waitConfirmations: 5,
    libraries: {
      StyleLibrary: StyleLibrary.address,
      BodyLibrary: BodyLibrary.address,
    },
  });

  // Getting a previously deployed contract
  const YourCollectible = await ethers.getContract("YourCollectible", deployer);
  // await YourCollectible.setPurpose("Hello");

  await YourCollectible.addNft(Eye.address);
  await YourCollectible.addNft(Head.address);
  await YourCollectible.addNft(Neck.address);
  await YourCollectible.addNft(Perch.address);
  await YourCollectible.addNft(Background.address);

  // // To take ownership of YourCollectible using the ownable library uncomment next line and add the
  // // address you want to be the owner.

  // await YourCollectible.transferOwnership(
  //   "0x54179E1770a780F2F541f23CB21252De12977d3c"
  // );

  /*
    To take ownership of yourContract using the ownable library uncomment next line and add the 
    address you want to be the owner. 
    // yourContract.transferOwnership(YOUR_ADDRESS_HERE);

    //const yourContract = await ethers.getContractAt('YourContract', "0xaAC799eC2d00C013f1F11c37E654e59B0429DF6A") //<-- if you want to instantiate a version of a contract at a specific address!
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
  const yourContract = await deploy("YourContract", [], {
  value: ethers.utils.parseEther("0.05")
  });
  */

  /*
  //If you want to link a library into your contract:
  // reference: https://github.com/austintgriffith/scaffold-eth/blob/using-libraries-example/packages/hardhat/scripts/deploy.js#L19
  const yourContract = await deploy("YourContract", [], {}, {
   LibraryName: **LibraryAddress**
  });
  */

  // Verify your contracts with Etherscan
  // You don't want to verify on localhost
  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: EyeLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: HeadLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: NeckLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: PerchLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Perch2Library.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: BackgroundLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Background2Library.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: BodyLibrary.address,
        contractArguments: [],
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Background.address,
        contractArguments: [],
        libraries: {
          BackgroundLibrary: BackgroundLibrary.address,
          Background2Library: Background2Library.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

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

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Head.address,
        contractArguments: [],
        libraries: {
          Head: Head.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Neck.address,
        contractArguments: [],
        libraries: {
          Neck: Neck.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

  try {
    if (chainId !== localChainId) {
      await run("verify:verify", {
        address: Perch.address,
        contractArguments: [],
        libraries: {
          PerchLibrary: PerchLibrary.address,
          Perch2Library: Perch2Library.address,
        },
      });
    }
  } catch (err) {
    if (err.message.includes("Reason: Already Verified")) {
      console.log("Contract is already verified!");
    }
  }

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
module.exports.tags = [
  "EyeLibrary",
  "HeadLibrary",
  "NeckLibrary",
  "PerchLibrary",
  "Perch2Library",
  "BackgroundLibrary",
  "Background2Library",
  "Eye",
  "Head",
  "Neck",
  "Perch",
  "Background",
  "YourCollectible",
];
