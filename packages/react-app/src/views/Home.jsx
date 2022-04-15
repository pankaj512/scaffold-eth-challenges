import { useContractReader } from "eth-hooks";
import { ethers } from "ethers";
import { React, useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { Address, AddressInput, Balance, Blockie, TransactionListItem } from "../components";
import QR from "qrcode.react";

import { Owners, Transactions, CreateTransaction } from "../views";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Home({
  userProvider,
  mainnetProvider,
  localProvider,
  blockExplorer,
  nonce,
  ownerEvents,
  signaturesRequired,
  poolServerUrl,
  contractName,
  address,
  tx,
  writeContracts,
  readContracts,
  multisigAddress,
  setRoute,
  yourLocalBalance,
  price,
}) {
  // you can also use hooks locally in your component of choice
  // in this case, let's keep track of 'purpose' variable from our contract
  return (
    <div className="home">
      {multisigAddress && (
        <div className="home-item home-address" style={{ margin: 32 }}>
          <div>
            <h2>MultiSigWallet 💰 </h2>
          </div>
          <div>
            <Balance address={multisigAddress} provider={localProvider} dollarMultiplier={price} fontSize={64} />
          </div>
          <div>
            <QR
              value={multisigAddress}
              size="180"
              level="H"
              includeMargin
              renderAs="svg"
              imageSettings={{ excavate: false }}
            />
          </div>
          <div>
            <Address
              address={multisigAddress}
              ensProvider={mainnetProvider}
              blockExplorer={blockExplorer}
              fontSize={32}
            />
          </div>
        </div>
      )}

      <div className="home-item home-owners" style={{ margin: 32 }}>
        <Owners
          mainnetProvider={mainnetProvider}
          localProvider={localProvider}
          blockExplorer={blockExplorer}
          nonce={nonce}
          ownerEvents={ownerEvents}
          signaturesRequired={signaturesRequired}
        />
      </div>
      <div className="home-item home-create" style={{ margin: 32 }}>
        <CreateTransaction
          poolServerUrl={poolServerUrl}
          contractName={contractName}
          address={address}
          userProvider={userProvider}
          mainnetProvider={mainnetProvider}
          localProvider={localProvider}
          yourLocalBalance={yourLocalBalance}
          price={price}
          tx={tx}
          writeContracts={writeContracts}
          readContracts={readContracts}
          setRoute={setRoute}
        />
      </div>
    </div>
  );
}

export default Home;
