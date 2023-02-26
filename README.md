# 🏗 scaffold-eth | 🏰 BuidlGuidl

## 🚩 Challenge 7: 🥩 Composable On Chain SVG NFT

> 🦸 A superpower of Ethereum is allowing you, the builder, to create a simple set of rules that an adversarial group of players can use to work together. In this challenge, you will create a web3 application where users can mint svg nfts. This web3 application will also let user upgrade their nft with add on components. Follow the instructions to build your web3 application.

> 🌟 The final deliverable is deploying a Dapp that lets users mint nft and upgrade their nft with custom components, then `yarn build` and `yarn surge` your app to a public webserver. Submit the url on [SpeedRunEthereum.com](https://speedrunethereum.com)!

> 💬 Meet other builders working on this challenge and get help in the [Challenge 7 telegram]()!

🧫 Front end for this challenge is already build so no need to change anything enless you want to give your custom look and feel.

---

### Checkpoint 0: 📦 install 📚

Want a fresh cloud environment? Click this to open a gitpod workspace, then skip to Checkpoint 1 after the tasks are complete.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/scaffold-eth/scaffold-eth-challenges/tree/challenge-composable-onchain-svg-nft)

```bash

git clone https://github.com/scaffold-eth/scaffold-eth-challenges.git challenge-composable-onchain-svg-nft

cd challenge-composable-onchain-svg-nft

git checkout challenge-composable-onchain-svg-nft

yarn install

```

### Checkpoint 1: 🔭 Environment 📺

You'll have three terminals up for:

```bash
yarn start   (react app frontend)
yarn chain   (hardhat backend)
yarn deploy  (to compile, deploy, and publish your contracts to the frontend)
```

> 💻 View your frontend at http://localhost:3000/

> 👩‍💻 Rerun `yarn deploy --reset` whenever you want to deploy new contracts to the frontend.

---

✏ Need to troubleshoot your code? If you import `hardhat/console.sol` to your contract, you can call `console.log()` right in your Solidity code. The output will appear in your `yarn chain` terminal.

---

### Checkpoint 2: 🥩 Explore Design SVG files 💵

In `packages/assets/` you will find the SVG files required for this challenge. Descriptions of each files is as follows:

- BaseParrot - This file tell about components of base parrot body. And possible color combination each set fo components can take.
  ![Base Parrot](./packages/assets/BaseParrot.jpg)

- Layer Guild - This file tell what different types of component aka accessories this parrot can wear like eye, head, neck, perch & background.
  ![Layer Guild](./packages/assets/Layer%20Guide.svg)

- Finished final NFT - This is how a finished NFT will look like if added all the components.
  ![Final Build](./packages/assets/Parrot%20NFT%20Final.svg)

---

### Checkpoint 3: 🔬 Building base Parrot NFT ⏱

### 🥅 Goals

- [ ] Can you mint base parrot NFT?

---

### Checkpoint 4: 🔬 Building Component EYE NFT ⏱

### 🥅 Goals

- [ ] Can you mint individual EYE component NFT?

---

### Checkpoint 5: 🔬 Upgrade base NFT with component ⏱

### 🥅 Goals

- [ ] Can user upgrade their base parrot NFT with eye component?

---

## ⚔️ Side Quests

- [ ] Can you build other remaining components i.e Head, Neck, Perch & Background?

---

### Checkpoint 6: 🚢 Ship it 🚁

📡 Edit the `defaultNetwork` to [your choice of public EVM networks](https://ethereum.org/en/developers/docs/networks/) in `packages/hardhat/hardhat.config.js`

👩‍🚀 You will want to run `yarn account` to see if you have a **deployer address**

🔐 If you don't have one, run `yarn generate` to create a mnemonic and save it locally for deploying.

⛽️ You will need to send ETH to your **deployer address** with your wallet.

> 🚀 Run `yarn deploy` to deploy your smart contract to a public network (selected in hardhat.config.js)

---

### Checkpoint 7: 🎚 Frontend 🧘‍♀️

> 📝 Edit the `targetNetwork` in `App.jsx` (in `packages/react-app/src`) to be the public network where you deployed your smart contract.

> 💻 View your frontend at http://localhost:3000/

📡 When you are ready to ship the frontend app...

📦 Run `yarn build` to package up your frontend.

💽 Upload your app to surge with `yarn surge` (you could also `yarn s3` or maybe even `yarn ipfs`?)

> 😬 Windows users beware! You may have to change the surge code in `packages/react-app/package.json` to just `"surge": "surge ./build",`

⚙ If you get a permissions error `yarn surge` again until you get a unique URL, or customize it in the command line.

> 📝 you will use this deploy URL to submit to [SpeedRunEthereum.com](https://speedrunethereum.com).

🚔 Traffic to your url might break the [Infura](https://infura.io/) rate limit, edit your key: `constants.js` in `packages/ract-app/src`.

---

### Checkpoint 8: 📜 Contract Verification

Update the api-key in packages/hardhat/package.json file. You can get your key [here](https://etherscan.io/myapikey).

![Screen Shot 2021-11-30 at 10 21 01 AM](https://user-images.githubusercontent.com/9419140/144075208-c50b70aa-345f-4e36-81d6-becaa5f74857.png)

> Now you are ready to run the `yarn verify --network your_network` command to verify your contracts on etherscan 🛰

---

> 🏃 Head to your next challenge [here](https://speedrunethereum.com).

> 💬 Problems, questions, comments on the stack? Post them to the [🏗 scaffold-eth developers chat](https://t.me/joinchat/F7nCRK3kI93PoCOk)
