import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import { Button, Select, Input } from "antd";
import { parseEther } from "@ethersproject/units";
import { AddressInput, EtherInput } from "../components";
import { ethers } from "ethers";

const { Option } = Select;

const axios = require("axios");

export default function CreateTransaction({
  poolServerUrl,
  contractName,
  address,
  mainnetProvider,
  localProvider,
  price,
  readContracts,
}) {
  const history = useHistory();

  const [methodName, setMethodName] = useState("addSigner");
  const [userInputAddress, setUserInputAddress] = useState();
  const [funds, setAmount] = useState(0);
  const [newSignaturesRequired, setNewSignaturesRequired] = useState();
  const [callData, setCallData] = useState();
  const [txHash, settxHash] = useState();
  const [clicked, setClicked] = useState(false);

  const createTransaction = async () => {
    const isOwner = await readContracts[contractName].owners(address);
    console.log("isOwner", isOwner);
    const contractAddress = await readContracts[contractName].address;
    console.log("Constact address", contractAddress);

    const nonce = await readContracts[contractName].nonce();
    console.log("nonce", nonce);

    const amount = 0;
    if (isOwner) {
      const res = await axios.post(poolServerUrl, {
        chainId: localProvider._network.chainId,
        address: contractAddress,
        nonce: nonce.toNumber(),
        to: contractAddress,
        amount,
        data: callData,
        hash: txHash,
        signatures: [],
        signers: [],
      });

      console.log("RESULT", res.data);

      setTimeout(() => {
        history.push("/pool");
      }, 2777);

      setCallData();
      settxHash();
      setUserInputAddress();
      setAmount(0);
      setNewSignaturesRequired();
      setClicked(false);
    } else {
      console.log("ERROR, NOT OWNER.");
    }
  };

  const updateTxHash = async data => {
    const nonce = await readContracts[contractName].nonce();
    console.log("nonce", nonce);
    const value = parseEther("" + parseFloat(0).toFixed(12));
    console.log("value", value);
    const contractAddress = await readContracts[contractName].address;
    console.log("Contract", contractAddress);
    const newHash = await readContracts[contractName].getTransactionHash(nonce, contractAddress, value, data);
    console.log("newHash", newHash);
    data && settxHash(newHash);
  };

  const handleSubmit = async () => {
    const functionArguments = [];
    if (userInputAddress || newSignaturesRequired) {
      const data = methodName !== "updateMinSignature" ? userInputAddress : newSignaturesRequired;
      functionArguments.push(data);
    }
    console.log(userInputAddress);
    if (methodName === "transferFund") {
      console.log(funds);
      const value = funds ? parseEther("" + funds) : parseEther("0");
      functionArguments.push(value);
    }
    console.log(functionArguments, methodName);
    const encoded =
      arguments.size !== 0
        ? await readContracts[contractName].interface.encodeFunctionData(methodName, functionArguments)
        : "0x";
    console.log("call data", encoded);
    setCallData(encoded);

    arguments.size !== 0 && updateTxHash(encoded);
    arguments.size !== 0 && setClicked(true);
  };

  return (
    <div className="OwnersPage">
      <div className="OwnerItems">
        <div>
          <h2>Transaction</h2>
        </div>
        <div style={{ margin: 8, padding: 8 }}>
          <Select
            value={methodName}
            style={{ width: "100%" }}
            onChange={e => {
              setCallData();
              settxHash();
              setUserInputAddress();
              setAmount(0);
              setNewSignaturesRequired();
              setClicked(false);
              setMethodName(e);
            }}
          >
            <Option key="addSigner">Add Owner</Option>
            <Option key="removeSigner">Remove Owner</Option>
            <Option key="transferFund">Transfer Fund</Option>
            <Option key="updateMinSignature">Update Signatures</Option>
          </Select>
        </div>

        {methodName !== "updateMinSignature" && (
          <div style={{ margin: 8, padding: 8 }}>
            <AddressInput
              autoFocus
              ensProvider={mainnetProvider}
              placeholder="input address"
              value={userInputAddress}
              onChange={setUserInputAddress}
            />
          </div>
        )}

        {methodName === "updateMinSignature" && (
          <div style={{ margin: 8, padding: 8 }}>
            <Input
              ensProvider={mainnetProvider}
              placeholder="new # of signatures required"
              value={newSignaturesRequired}
              onChange={e => {
                setNewSignaturesRequired(e.target.value);
              }}
            />
          </div>
        )}

        {methodName === "transferFund" && (
          <div style={{ margin: 8, padding: 8 }}>
            <EtherInput price={price} mode="USD" value={funds} onChange={setAmount} />
          </div>
        )}

        <div style={{ margin: 8, padding: 8 }}>
          <Button onClick={handleSubmit}>
            {methodName === "addSigner" && "Add Owner"}
            {methodName === "removeSigner" && "Remove Owner"}
            {methodName === "transferFund" && "Transfer"}
            {methodName === "updateMinSignature" && "Update Sign"}
          </Button>
        </div>

        <div style={{ margin: 8, padding: 8 }}>
          Call Data
          <Input disabled placeholder="calldata" value={callData} />
        </div>
        <div style={{ margin: 8, padding: 8 }}>
          TX Hash
          <Input disabled placeholder="transaction hash" value={txHash} />
        </div>

        <div style={{ margin: 8, padding: 8 }}>
          {clicked && <Button onClick={createTransaction}>Send Transaction</Button>}
          {!clicked && (
            <Button disabled onClick={createTransaction}>
              Send Transaction
            </Button>
          )}
        </div>
      </div>
    </div>
  );
}
