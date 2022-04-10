import React, { useCallback, useEffect, useState, usePoller } from "react";
import { Button, List, Divider, Input, Card, DatePicker, Slider, Switch, Progress, Spin } from "antd";
import { SyncOutlined } from "@ant-design/icons";
import { parseEther, formatEther } from "@ethersproject/units";
import { ethers } from "ethers";
import { Address, AddressInput, Balance, Blockie, TransactionListItem } from "../components";
import { useContractReader, useEventListener, useInterval } from "../hooks";

const axios = require("axios");

const DEBUG = false;

export default function Transactions({
  poolServerUrl,
  contractName,
  signaturesRequired,
  address,
  nonce,
  userProvider,
  mainnetProvider,
  localProvider,
  yourLocalBalance,
  price,
  tx,
  readContracts,
  writeContracts,
  blockExplorer,
}) {
  const [transactions, setTransactions] = useState();

  const getTransactions = async () => {
    if (true) console.log("🛰 Requesting Transaction List");
    const contractAddress = await readContracts[contractName].address;
    const url = await (poolServerUrl + contractAddress + "_" + localProvider._network.chainId);
    const res = await axios.get(url);

    const newTransactions = [];
    for (const i in res.data) {
      // for each transaction
      console.log(res.data[i]);
      const tranasactionNonce = ethers.BigNumber.from(res.data[i].nonce);
      const currentNonce = nonce;

      if (tranasactionNonce && currentNonce && tranasactionNonce.gte(currentNonce)) {
        const validSignatures = [];
        for (const s in res.data[i].signatures) {
          const signer = await readContracts[contractName].recoverSigner(res.data[i].hash, res.data[i].signatures[s]);
          const isOwner = await readContracts[contractName].owners(signer);
          if (signer && isOwner) {
            validSignatures.push({ signer, signature: res.data[i].signatures[s] });
          }
        }
        const update = { ...res.data[i], validSignatures };
        newTransactions.push(update);
      }
    }
    setTransactions(newTransactions);
  };

  useInterval(getTransactions, 3770);

  const getSortedSigList = async (allSigs, newHash) => {
    console.log("allSigs", allSigs);

    const sigList = [];
    for (const s in allSigs) {
      console.log("SIG", allSigs[s]);
      const recover = await readContracts[contractName].recoverSigner(newHash, allSigs[s]);
      sigList.push({ signature: allSigs[s], signer: recover });
    }

    sigList.sort((a, b) => {
      return ethers.BigNumber.from(a.signer).sub(ethers.BigNumber.from(b.signer));
    });

    console.log("SORTED SIG LIST:", sigList);

    const finalSigList = [];
    const finalSigners = [];
    const used = {};
    for (const s in sigList) {
      if (!used[sigList[s].signature]) {
        finalSigList.push(sigList[s].signature);
        finalSigners.push(sigList[s].signer);
      }
      used[sigList[s].signature] = true;
    }

    console.log("FINAL SIG LIST:", finalSigList);
    return [finalSigList, finalSigners];
  };

  console.log("transactions", transactions);

  // const getMethods = obj => {
  //   let properties = new Set();
  //   let currentObj = obj;
  //   do {
  //     Object.getOwnPropertyNames(currentObj).map(item => properties.add(item));
  //   } while ((currentObj = Object.getPrototypeOf(currentObj)));
  //   console.log(properties);
  // };

  const signTransaction = async transaction => {
    console.log("item.signatures", transaction.signatures);

    const newHash = await readContracts[contractName].getTransactionHash(
      transaction.nonce,
      transaction.to,
      parseEther("" + parseFloat(transaction.amount).toFixed(12)),
      transaction.data,
    );

    const signature = await userProvider.signer.signMessage(ethers.utils.arrayify(newHash));
    console.log("signature", signature);

    const recover = await readContracts[contractName].recoverSigner(newHash, signature);
    console.log("recover--->", recover);

    const isOwner = await readContracts[contractName].owners(recover);
    console.log("isOwner", isOwner);

    if (isOwner) {
      const [finalSigList, finalSigners] = await getSortedSigList([...transaction.signatures, signature], newHash);
      const res = await axios.post(poolServerUrl, {
        ...transaction,
        signatures: finalSigList,
        signers: finalSigners,
      });
    }
  };

  const executeTransaction = async transaction => {
    const newHash = await readContracts[contractName].getTransactionHash(
      transaction.nonce,
      transaction.to,
      parseEther("" + parseFloat(transaction.amount).toFixed(12)),
      transaction.data,
    );
    console.log("newHash", newHash);

    console.log("transaction.signatures", transaction.signatures);

    const [finalSigList, finalSigners] = await getSortedSigList(transaction.signatures, newHash);

    tx(
      writeContracts[contractName].executeTransaction(
        transaction.to,
        parseEther("" + parseFloat(transaction.amount).toFixed(12)),
        transaction.data,
        finalSigList,
      ),
    );
  };

  if (!signaturesRequired) {
    return <Spin />;
  }

  return (
    <div style={{ maxWidth: 900, margin: "auto", marginTop: 32, marginBottom: 32 }}>
      <h1>
        <b style={{ padding: 16 }}>#{nonce ? nonce.toNumber() : <Spin />}</b>
      </h1>

      <List
        bordered
        dataSource={transactions}
        renderItem={transaction => {
          const hasSigned = transaction.signers.indexOf(address) >= 0;
          // const hasEnoughSignatures = transaction.signatures.length <= signaturesRequired.toNumber();

          return (
            <List.Item key={transaction.hash}>
              <TransactionListItem
                item={transaction}
                mainnetProvider={mainnetProvider}
                blockExplorer={blockExplorer}
                price={price}
                readContracts={readContracts}
                contractName={contractName}
              >
                <span>
                  {transaction.signatures.length}/{signaturesRequired.toNumber()} {hasSigned ? "✅" : "❌"}
                </span>
                <Button
                  onClick={e => {
                    signTransaction(transaction);
                  }}
                  type="secondary"
                  style={{ marginLeft: 10 }}
                >
                  Sign
                </Button>
                <Button
                  onClick={e => {
                    executeTransaction(transaction);
                  }}
                  key={transaction.hash}
                  style={{ marginLeft: 10 }}
                >
                  Exec
                </Button>
              </TransactionListItem>
            </List.Item>
          );
        }}
      />
    </div>
  );
}
