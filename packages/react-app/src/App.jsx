import { Button, Col, Menu, Row, Select, Alert } from "antd";
import "antd/dist/antd.css";
import {
  useBalance,
  useContractLoader,
  useContractReader,
  useGasPrice,
  useOnBlock,
  useUserProviderAndSigner,
  useUserAddress,
} from "eth-hooks";
import { useExchangeEthPrice } from "eth-hooks/dapps/dex";
import React, { useCallback, useEffect, useState } from "react";
import { Link, Route, Switch, useLocation } from "react-router-dom";
import "./App.css";
import {
  Account,
  Contract,
  Faucet,
  GasGauge,
  Header,
  Ramp,
  ThemeSwitch,
  NetworkDisplay,
  FaucetHint,
  NetworkSwitch,
  CreateMultiSigModal,
} from "./components";
import { NETWORKS, ALCHEMY_KEY } from "./constants";
import externalContracts from "./contracts/external_contracts";
// contracts
import deployedContracts from "./contracts/hardhat_contracts.json";
import multiSigWalletABI from "./contracts/MultiSigWallet.json";
import { Transactor, Web3ModalSetup } from "./helpers";
import { Home, MultiSigEvent, Owners, Transactions, CreateTransaction } from "./views";
import { useStaticJsonRPC, useUserProvider } from "./hooks";
import { useEventListener } from "eth-hooks/events/useEventListener";

const { ethers } = require("ethers");
/*
    Welcome to 🏗 scaffold-eth !

    Code:
    https://github.com/scaffold-eth/scaffold-eth

    Support:
    https://t.me/joinchat/KByvmRe5wkR-8F_zz6AjpA
    or DM @austingriffith on twitter or telegram

    You should get your own Alchemy.com & Infura.io ID and put it in `constants.js`
    (this is your connection to the main Ethereum network for ENS etc.)


    🌏 EXTERNAL CONTRACTS:
    You can also bring in contract artifacts in `constants.js`
    (and then use the `useExternalContractLoader()` hook!)
*/

/// 📡 What chain are your contracts deployed to?
const initialNetwork = NETWORKS.sepolia; // <------- select your target frontend network (localhost, rinkeby, xdai, mainnet)

// 😬 Sorry for all the console logging
const DEBUG = true;
const NETWORKCHECK = true;
const USE_BURNER_WALLET = true; // toggle burner wallet feature
const USE_NETWORK_SELECTOR = false;

const web3Modal = Web3ModalSetup();

// 🛰 providers
const providers = [
  "https://eth-mainnet.gateway.pokt.network/v1/lb/611156b4a585a20035148406",
  `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_KEY}`,
  "https://rpc.scaffoldeth.io:48544",
];

// const poolServerUrl = "https://backend.multisig.holdings:49832/"
const poolServerUrl = "https://weary-ring-cod.cyclic.app/";
//const poolServerUrl = "http://localhost:49832/";

function App(props) {
  // specify all the chains your app is available on. Eg: ['localhost', 'mainnet', ...otherNetworks ]
  // reference './constants.js' for other networks
  const networkOptions = [initialNetwork.name, "mainnet", "rinkeby"];

  const [injectedProvider, setInjectedProvider] = useState();
  const [address, setAddress] = useState();
  const [selectedNetwork, setSelectedNetwork] = useState(networkOptions[0]);
  const location = useLocation();

  const targetNetwork = NETWORKS[selectedNetwork];

  // 🔭 block explorer URL
  const blockExplorer = targetNetwork.blockExplorer;

  // load all your providers
  const localProvider = useStaticJsonRPC([
    process.env.REACT_APP_PROVIDER ? process.env.REACT_APP_PROVIDER : targetNetwork.rpcUrl,
  ]);
  const mainnetProvider = useStaticJsonRPC(providers);

  if (DEBUG) console.log(`Using ${selectedNetwork} network`);

  // 🛰 providers
  if (DEBUG) console.log("📡 Connecting to Mainnet Ethereum");

  const logoutOfWeb3Modal = async () => {
    await web3Modal.clearCachedProvider();
    if (injectedProvider && injectedProvider.provider && typeof injectedProvider.provider.disconnect == "function") {
      await injectedProvider.provider.disconnect();
    }
    setTimeout(() => {
      window.location.reload();
    }, 1);
  };

  /* 💵 This hook will get the price of ETH from 🦄 Uniswap: */
  const price = useExchangeEthPrice(targetNetwork, mainnetProvider);

  /* 🔥 This hook will get the price of Gas from ⛽️ EtherGasStation */
  const gasPrice = useGasPrice(targetNetwork, "fast");
  // Use your injected provider from 🦊 Metamask or if you don't have it then instantly generate a 🔥 burner wallet.
  //const userProviderAndSigner = useUserProvider(injectedProvider, localProvider);
  const userProviderAndSigner = useUserProviderAndSigner(injectedProvider, localProvider, USE_BURNER_WALLET);
  const userSigner = userProviderAndSigner.signer;

  useEffect(() => {
    async function getAddress() {
      if (userSigner) {
        const newAddress = await userSigner.getAddress();
        setAddress(newAddress);
      }
    }
    getAddress();
  }, [userSigner]);

  // You can warn the user if you would like them to be on a specific network
  const localChainId = localProvider && localProvider._network && localProvider._network.chainId;
  const selectedChainId =
    userSigner && userSigner.provider && userSigner.provider._network && userSigner.provider._network.chainId;

  // For more hooks, check out 🔗eth-hooks at: https://www.npmjs.com/package/eth-hooks

  // The transactor wraps transactions and provides notificiations
  const tx = Transactor(userSigner, gasPrice);

  // 🏗 scaffold-eth is full of handy hooks like this one to get your balance:
  const yourLocalBalance = useBalance(localProvider, address);

  // Just plug in different 🛰 providers to get your balance on different chains:
  const yourMainnetBalance = useBalance(mainnetProvider, address);

  // const contractConfig = useContractConfig();

  const contractConfig = { deployedContracts: deployedContracts || {}, externalContracts: externalContracts || {} };

  // Load in your local 📝 contract and read a value from it:
  const readContracts = useContractLoader(localProvider, contractConfig);

  // If you want to make 🔐 write transactions to your contracts, use the userSigner:
  const writeContracts = useContractLoader(userSigner, contractConfig, localChainId);

  // EXTERNAL CONTRACT EXAMPLE:
  //
  // If you want to bring in the mainnet DAI contract it would look like:
  const mainnetContracts = useContractLoader(mainnetProvider, contractConfig);

  // If you want to call a function on a new block
  useOnBlock(mainnetProvider, () => {
    console.log(`⛓ A new mainnet block is here: ${mainnetProvider._lastBlockNumber}`);
  });

  // Then read your DAI balance like:
  const myMainnetDAIBalance = useContractReader(mainnetContracts, "DAI", "balanceOf", [
    "0x34aA3F359A9D614239015126635CE7732c18fDF3",
  ]);

  const faucetAvailable = localProvider && localProvider.connection && targetNetwork.name.indexOf("local") !== -1;
  //
  // 🧫 DEBUG 👨🏻‍🔬
  //
  useEffect(() => {
    if (
      DEBUG &&
      mainnetProvider &&
      address &&
      selectedChainId &&
      yourLocalBalance &&
      yourMainnetBalance &&
      readContracts &&
      writeContracts &&
      mainnetContracts
    ) {
      console.log("_____________________________________ 🏗 scaffold-eth _____________________________________");
      console.log("🌎 mainnetProvider", mainnetProvider);
      console.log("🏠 localChainId", localChainId);
      console.log("👩‍💼 selected address:", address);
      console.log("🕵🏻‍♂️ selectedChainId:", selectedChainId);
      console.log("💵 yourLocalBalance", yourLocalBalance ? ethers.utils.formatEther(yourLocalBalance) : "...");
      console.log("💵 yourMainnetBalance", yourMainnetBalance ? ethers.utils.formatEther(yourMainnetBalance) : "...");
      console.log("📝 readContracts", readContracts);
      console.log("🌍 DAI contract on mainnet:", mainnetContracts);
      console.log("💵 yourMainnetDAIBalance", myMainnetDAIBalance);
      console.log("🔐 writeContracts", writeContracts);
    }
  }, [
    mainnetProvider,
    address,
    selectedChainId,
    yourLocalBalance,
    yourMainnetBalance,
    readContracts,
    writeContracts,
    mainnetContracts,
    localChainId,
    myMainnetDAIBalance,
  ]);

  const loadWeb3Modal = useCallback(async () => {
    const provider = await web3Modal.connect();
    setInjectedProvider(new ethers.providers.Web3Provider(provider));

    provider.on("chainChanged", chainId => {
      console.log(`chain changed to ${chainId}! updating providers`);
      setInjectedProvider(new ethers.providers.Web3Provider(provider));
    });

    provider.on("accountsChanged", () => {
      console.log(`account changed!`);
      setInjectedProvider(new ethers.providers.Web3Provider(provider));
    });

    // Subscribe to session disconnection
    provider.on("disconnect", (code, reason) => {
      console.log(code, reason);
      logoutOfWeb3Modal();
    });
    // eslint-disable-next-line
  }, [setInjectedProvider]);

  useEffect(() => {
    if (web3Modal.cachedProvider) {
      loadWeb3Modal();
    }
  }, [loadWeb3Modal]);

  const [route, setRoute] = useState();
  useEffect(() => {
    setRoute(window.location.pathname);
  }, [setRoute]);

  const contractFactoryName = "MultiSigFactory";
  const contractName = "MultiSigWallet";

  // MultiSigFactory Events:
  const ownersMultiSigEvents = useEventListener(readContracts, contractFactoryName, "Owners", localProvider, 1);
  if (DEBUG) console.log("📟 ownersMultiSigEvents:", ownersMultiSigEvents);

  // all multisig where this address is owner
  const [multiSigs, setMultiSigs] = useState([]);
  // current multisig selected by the user
  const [currentMultiSigAddress, setCurrentMultiSigAddress] = useState();
  console.log("currentMultiSigAddress:", currentMultiSigAddress);

  useEffect(() => {
    if (address) {
      const multiSigsForUser = ownersMultiSigEvents.reduce((filtered, createEvent) => {
        if (createEvent.args.owners.includes(address) && !filtered.includes(createEvent.args.contractAddress)) {
          filtered.push(createEvent.args.contractAddress);
        }

        return filtered;
      }, []);

      if (multiSigsForUser.length > 0) {
        if (!currentMultiSigAddress) {
          const recentMultiSigAddress = multiSigsForUser[multiSigsForUser.length - 1];
          setCurrentMultiSigAddress(recentMultiSigAddress);
        }
        setMultiSigs(multiSigsForUser);
      }
    }
  }, [ownersMultiSigEvents, address, currentMultiSigAddress]);

  const handleMultiSigChange = value => {
    setCurrentMultiSigAddress(value);
  };

  const userHasMultiSigs = currentMultiSigAddress ? true : false;

  const [nonce, setNonce] = useState(0);
  const [signaturesRequired, setSignaturesRequired] = useState(0);

  useEffect(() => {
    async function getContractValues() {
      const nonce = await readContracts.MultiSigWallet.nonce();
      setNonce(nonce);
      const min_signatures = await readContracts.MultiSigWallet.minSignature();
      setSignaturesRequired(min_signatures);
    }

    if (currentMultiSigAddress) {
      readContracts.MultiSigWallet = new ethers.Contract(currentMultiSigAddress, multiSigWalletABI, localProvider);
      writeContracts.MultiSigWallet = new ethers.Contract(currentMultiSigAddress, multiSigWalletABI, userSigner);
      getContractValues();
    }
  }, [currentMultiSigAddress, readContracts, writeContracts]);

  // keep track of a variable from the contract in the local React state:

  if (DEBUG) console.log("# nonce:", nonce);

  // MultiSigWallet Events:
  const allExecuteTransactionEvents = useEventListener(
    currentMultiSigAddress ? readContracts : null,
    contractName,
    "ExecuteTransaction",
    localProvider,
    1,
  );
  if (DEBUG) console.log("📟 All executeTransactionEvents:", allExecuteTransactionEvents);

  const allOwnerEvents = useEventListener(
    currentMultiSigAddress ? readContracts : null,
    contractName,
    "Signer",
    localProvider,
    1,
  );
  if (DEBUG) console.log("📟 all ownerEvents:", allOwnerEvents);

  const [ownerEvents, setOwnerEvents] = useState();
  const [executeTransactionEvents, setExecuteTransactionEvents] = useState();

  useEffect(() => {
    async function getContractValues() {
      const nonce = await readContracts.MultiSigWallet.nonce();
      setNonce(nonce);
      const min_signatures = await readContracts.MultiSigWallet.minSignature();
      setSignaturesRequired(min_signatures);
    }

    setExecuteTransactionEvents(
      allExecuteTransactionEvents.filter(contractEvent => contractEvent.address === currentMultiSigAddress),
    );
    setOwnerEvents(allOwnerEvents.filter(contractEvent => contractEvent.address === currentMultiSigAddress));

    if (currentMultiSigAddress) getContractValues();
  }, [allExecuteTransactionEvents, allOwnerEvents, currentMultiSigAddress, readContracts.MultiSigWallet]);

  if (DEBUG) console.log("📟 executeTransactionEvents:", executeTransactionEvents);
  if (DEBUG) console.log("📟 ownerEvents:", ownerEvents);
  if (DEBUG) console.log("✳️ signaturesRequired:", signaturesRequired);
  const [isCreateModalVisible, setIsCreateModalVisible] = useState(false);

  return (
    <div className="App">
      {/* ✏️ Edit the header and change the title to your project name */}
      <Header subTitle={"Multi Signature Wallet"} />
      <NetworkDisplay
        NETWORKCHECK={NETWORKCHECK}
        localChainId={localChainId}
        selectedChainId={selectedChainId}
        targetNetwork={targetNetwork}
        logoutOfWeb3Modal={logoutOfWeb3Modal}
        USE_NETWORK_SELECTOR={USE_NETWORK_SELECTOR}
      />
      <div style={{ position: "relative" }}>
        <div style={{ position: "absolute", left: 20 }}>
          <CreateMultiSigModal
            price={price}
            selectedChainId={selectedChainId}
            mainnetProvider={mainnetProvider}
            address={address}
            tx={tx}
            writeContracts={writeContracts}
            contractName={contractFactoryName}
            isCreateModalVisible={isCreateModalVisible}
            setIsCreateModalVisible={setIsCreateModalVisible}
          />
          <Select value={currentMultiSigAddress} style={{ minWidth: 120 }} onChange={handleMultiSigChange}>
            {multiSigs.map((address, index) => (
              <Select.Option key={index} value={address}>
                {address?.substr(0, 8) + "..." + address?.substr(-8)}
              </Select.Option>
            ))}
          </Select>
        </div>
      </div>
      <Menu
        disabled={!userHasMultiSigs}
        style={{ textAlign: "center", marginTop: 40 }}
        selectedKeys={[location.pathname]}
        mode="horizontal"
      >
        <Menu.Item key="/">
          <Link to="/">App Home</Link>
        </Menu.Item>
        <Menu.Item key="/events">
          <Link to="/events">Events</Link>
        </Menu.Item>
        <Menu.Item key="/pool">
          <Link to="/pool">Transaction</Link>
        </Menu.Item>
        <Menu.Item key="/debug">
          <Link to="/debug">Debug Contracts</Link>
        </Menu.Item>
      </Menu>

      <Switch>
        <Route exact path="/">
          {/* <Home yourLocalBalance={yourLocalBalance} contractName={contractName} readContracts={readContracts} /> */}
          {!userHasMultiSigs ? (
            <Row style={{ marginTop: 40 }}>
              <Col span={12} offset={6}>
                <Alert
                  message={
                    <>
                      ✨{" "}
                      <Button onClick={() => setIsCreateModalVisible(true)} type="link" style={{ padding: 0 }}>
                        Create
                      </Button>{" "}
                      or select your Multi-Sig ✨
                    </>
                  }
                  type="info"
                />
              </Col>
            </Row>
          ) : (
            <Home
              mainnetProvider={mainnetProvider}
              localProvider={localProvider}
              blockExplorer={blockExplorer}
              nonce={nonce}
              ownerEvents={ownerEvents}
              signaturesRequired={signaturesRequired}
              poolServerUrl={poolServerUrl}
              contractName={contractName}
              multisigAddress={currentMultiSigAddress}
              address={address}
              userProvider={userProviderAndSigner}
              yourLocalBalance={yourLocalBalance}
              price={price}
              tx={tx}
              writeContracts={writeContracts}
              readContracts={readContracts}
              setRoute={setRoute}
            />
          )}
        </Route>
        <Route exact path="/events">
          <MultiSigEvent
            mainnetProvider={mainnetProvider}
            localProvider={localProvider}
            blockExplorer={blockExplorer}
            nonce={nonce}
            ownerEvents={ownerEvents}
            signaturesRequired={signaturesRequired}
            poolServerUrl={poolServerUrl}
            contractName={contractName}
            address={address}
            userProvider={userProviderAndSigner}
            yourLocalBalance={yourLocalBalance}
            price={price}
            tx={tx}
            writeContracts={writeContracts}
            readContracts={readContracts}
            setRoute={setRoute}
            executeTransactionEvents={executeTransactionEvents}
          ></MultiSigEvent>
        </Route>
        <Route exact path="/pool">
          <Transactions
            poolServerUrl={poolServerUrl}
            contractName={contractName}
            contractAddress={currentMultiSigAddress}
            address={address}
            userProvider={userProviderAndSigner}
            mainnetProvider={mainnetProvider}
            localProvider={localProvider}
            yourLocalBalance={yourLocalBalance}
            price={price}
            tx={tx}
            writeContracts={writeContracts}
            readContracts={readContracts}
            blockExplorer={blockExplorer}
            nonce={nonce}
            signaturesRequired={signaturesRequired}
          />
        </Route>
        <Route exact path="/debug">
          {/*
                🎛 this scaffolding is full of commonly used components
                this <Contract/> component will automatically parse your ABI
                and give you a form to interact with it locally
            */}

          <Contract
            name={contractFactoryName}
            price={price}
            signer={userSigner}
            provider={localProvider}
            address={address}
            blockExplorer={blockExplorer}
            contractConfig={contractConfig}
          />
        </Route>
      </Switch>

      <ThemeSwitch />

      {/* 👨‍💼 Your account is in the top right with a wallet at connect options */}
      <div style={{ position: "fixed", textAlign: "right", right: 0, top: 0, padding: 10 }}>
        <div style={{ display: "flex", flex: 1, alignItems: "center" }}>
          {USE_NETWORK_SELECTOR && (
            <div style={{ marginRight: 20 }}>
              <NetworkSwitch
                networkOptions={networkOptions}
                selectedNetwork={selectedNetwork}
                setSelectedNetwork={setSelectedNetwork}
              />
            </div>
          )}
          <Account
            useBurner={USE_BURNER_WALLET}
            address={address}
            localProvider={localProvider}
            userSigner={userSigner}
            mainnetProvider={mainnetProvider}
            price={price}
            web3Modal={web3Modal}
            loadWeb3Modal={loadWeb3Modal}
            logoutOfWeb3Modal={logoutOfWeb3Modal}
            blockExplorer={blockExplorer}
          />
        </div>
        {yourLocalBalance.lte(ethers.BigNumber.from("0")) && (
          <FaucetHint localProvider={localProvider} targetNetwork={targetNetwork} address={address} />
        )}
      </div>

      {/* 🗺 Extra UI like gas price, eth price, faucet, and support: */}
      <div style={{ position: "fixed", textAlign: "left", left: 0, bottom: 20, padding: 10 }}>
        <Row align="middle" gutter={[4, 4]}>
          <Col span={8}>
            <Ramp price={price} address={address} networks={NETWORKS} />
          </Col>

          <Col span={8} style={{ textAlign: "center", opacity: 0.8 }}>
            <GasGauge gasPrice={gasPrice} />
          </Col>
          <Col span={8} style={{ textAlign: "center", opacity: 1 }}>
            <Button
              onClick={() => {
                window.open("https://t.me/joinchat/KByvmRe5wkR-8F_zz6AjpA");
              }}
              size="large"
              shape="round"
            >
              <span style={{ marginRight: 8 }} role="img" aria-label="support">
                💬
              </span>
              Support
            </Button>
          </Col>
        </Row>

        <Row align="middle" gutter={[4, 4]}>
          <Col span={24}>
            {
              /*  if the local provider has a signer, let's show the faucet:  */
              faucetAvailable ? (
                <Faucet localProvider={localProvider} price={price} ensProvider={mainnetProvider} />
              ) : (
                ""
              )
            }
          </Col>
        </Row>
      </div>
    </div>
  );
}

export default App;
