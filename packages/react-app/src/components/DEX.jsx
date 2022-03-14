import { Card, Col, Divider, Input, Row, Button, Select } from "antd";
import { useBalance, useContractReader, useBlockNumber } from "eth-hooks";
import { useEventListener } from "eth-hooks/events/useEventListener";
import { useTokenBalance } from "eth-hooks/erc/erc-20/useTokenBalance";
import { ethers } from "ethers";
import React, { useState } from "react";
import Address from "./Address";
import Contract from "./Contract";
import Curve from "./Curve";
import TokenBalance from "./TokenBalance";
import Blockies from "react-blockies";

const contractName = "DEX";
const tokenName = "Balloons";

export default function Dex(props) {
  let display = [];

  const [form, setForm] = useState({});
  const [values, setValues] = useState({ exchange: "ETH", balloonQuery: "Approve", stake: "Deposit" });
  const tx = props.tx;

  const writeContracts = props.writeContracts;

  const contractAddress = props.readContracts[contractName].address;
  const tokenAddress = props.readContracts[tokenName].address;
  const contractBalance = useBalance(props.localProvider, contractAddress);

  const tokenBalance = useTokenBalance(props.readContracts[tokenName], contractAddress, props.localProvider);
  const tokenBalanceFloat = parseFloat(ethers.utils.formatEther(tokenBalance));
  const ethBalanceFloat = parseFloat(ethers.utils.formatEther(contractBalance));
  const liquidity = useContractReader(props.readContracts, contractName, "totalLiquidity");

  const userLiquidity = useContractReader(props.readContracts, "DEX", "getLiquidity", [props.address]);

  // 🏗 scaffold-eth is full of handy hooks like this one to get your balance:
  const yourLocalBalance = useBalance(props.localProvider, props.address);

  const balloonsContractAddress = props.readContracts["Balloons"].address;
  const balloonsContractBalance = useBalance(props.localProvider, balloonsContractAddress);

  const approveToken = async (address, amount) => {
    let valueInEther = ethers.utils.parseEther("" + amount);
    console.log("valueInEther", valueInEther);
    let allowance = await props.readContracts[tokenName].allowance(address, props.readContracts[contractName].address);
    console.log("allowance", allowance);

    let approveTx;
    if (allowance.lt(valueInEther)) {
      approveTx = await tx(
        writeContracts[tokenName].approve(props.readContracts[contractName].address, valueInEther, {
          gasLimit: 200000,
        }),
      );
    }

    return approveTx;
  };

  const getBalance = async address => {
    console.log(address);
    const output = await props.readContracts[tokenName].balanceOf(address);
    let tokenBalance = parseFloat(ethers.utils.formatEther(output)).toFixed(4);
    console.log("tokenBalance:", tokenBalance);
    let newValues = { ...values };
    newValues["approveOutput"] = tokenBalance;
    newValues["ApproveAddress"] = "";
    newValues["approveAmount"] = "";
    setValues(newValues);
  };

  const ethToToken = async value => {
    let valueInEther = ethers.utils.parseEther("" + value);
    let swapEthToTokenResult = await tx(writeContracts[contractName]["ethToToken"]({ value: valueInEther }));
    console.log("swapEthToTokenResult:", swapEthToTokenResult);
  };

  const tokenToEth = async value => {
    let valueInEther = ethers.utils.parseEther("" + value);
    let approveTx = await approveToken(props.address, value);

    let swapTx = tx(writeContracts[contractName]["tokenToEth"](valueInEther, { gasLimit: 200000 }));
    if (approveTx) {
      console.log("waiting on approve to finish...");
      let approveTxResult = await approveTx;
      console.log("approveTxResult:", approveTxResult);
    }
    let swapTxResult = await swapTx;
    console.log("swapTxResult:", swapTxResult);
  };

  const deposit = async value => {
    let valueInEther = ethers.utils.parseEther("" + value);
    let valuePlusExtra = ethers.utils.parseEther("" + value * 1.03);
    console.log("valuePlusExtra", valuePlusExtra);
    let allowance = await props.readContracts[tokenName].allowance(
      props.address,
      props.readContracts[contractName].address,
    );
    console.log("allowance", allowance);
    if (allowance.lt(valuePlusExtra)) {
      await tx(
        writeContracts[tokenName].approve(props.readContracts[contractName].address, valuePlusExtra, {
          gasLimit: 200000,
        }),
      );
    }
    await tx(writeContracts[contractName]["deposit"]({ value: valueInEther, gasLimit: 200000 }));
  };

  const withdraw = async value => {
    let valueInEther = ethers.utils.parseEther("" + value);
    let withdrawTxResult = await tx(writeContracts[contractName]["withdraw"](valueInEther));
    console.log("withdrawTxResult:", withdrawTxResult);
  };

  return (
    <div className="container">
      <div className="box user-data">
        <div className="items operation swap">
          <Card style={{ height: "100%" }} title="Exchange">
            <div style={{ padding: 8 }}>
              <Select
                showSearch
                defaultValue={values["exchange"]}
                style={{ width: "100%" }}
                onChange={e => {
                  let newValues = { ...values };
                  newValues["exchange"] = e;
                  console.log(newValues);
                  setValues(newValues);
                }}
              >
                <Select.Option value="ETH">ETH</Select.Option>
                <Select.Option value="Balloons">Balloons</Select.Option>
              </Select>
            </div>
            <div style={{ padding: 8 }}>
              <Input
                style={{ textAlign: "center" }}
                placeholder={values["exchange"] === "Balloons" ? "🎈 amount" : " Ξ amount"}
                value={values["exchangeValue"]}
                onChange={e => {
                  let newValues = { ...values };
                  newValues["exchangeValue"] = e.target.value;
                  console.log(newValues);
                  setValues(newValues);
                }}
              />
            </div>
            <div style={{ padding: 8 }}>
              <Button
                style={{ width: "100%" }}
                type={"primary"}
                onClick={() => {
                  values["exchange"] === "Balloons"
                    ? tokenToEth(values["exchangeValue"])
                    : ethToToken(values["exchangeValue"]);
                  let newValues = { ...values };
                  newValues["exchangeValue"] = "";
                  setValues(newValues);
                }}
              >
                Swap {values["exchange"] === "Balloons" ? "Balloons" : "ETH"}
              </Button>
            </div>
          </Card>
        </div>

        <div className="items contract balloon-contract">
          <Card style={{ height: "100%" }} title="Balloons Interface">
            {/* <div className="box contract-dex">
              <div style={{ padding: 8 }}>
                <Address value={balloonsContractAddress} />
              </div>
              <div style={{ fontSize: 24 }}>
                {parseFloat(ethers.utils.formatEther(balloonsContractBalance)).toFixed(4)}
              </div>
            </div> */}
            <div>
              <div style={{ padding: 8 }}>
                <Select
                  showSearch
                  defaultValue={values["balloonQuery"]}
                  style={{ width: "100%" }}
                  onChange={e => {
                    let newValues = { ...values };
                    newValues["approveOutput"] = "";
                    newValues["balloonQuery"] = e;
                    console.log(newValues);
                    setValues(newValues);
                  }}
                >
                  <Select.Option value="Approve">Approve</Select.Option>
                  <Select.Option value="Balance">Balance</Select.Option>
                </Select>
              </div>
              <div style={{ padding: 8 }}>
                <Input
                  style={{ textAlign: "center" }}
                  placeholder={"address"}
                  value={values["ApproveAddress"]}
                  onChange={e => {
                    let newValues = { ...values };
                    newValues["approveOutput"] = "";
                    newValues["ApproveAddress"] = e.target.value;
                    console.log(newValues);
                    setValues(newValues);
                  }}
                />
              </div>
              {values && values["balloonQuery"] === "Approve" && (
                <div style={{ padding: 8 }}>
                  <Input
                    style={{ textAlign: "center" }}
                    placeholder={"Ξ amount"}
                    value={values["approveAmount"]}
                    onChange={e => {
                      let newValues = { ...values };
                      newValues["approveAmount"] = e.target.value;
                      console.log(newValues);
                      setValues(newValues);
                    }}
                  />
                </div>
              )}
              <div style={{ padding: 8 }}>
                <Button
                  style={{ width: "100%" }}
                  type={"primary"}
                  onClick={() => {
                    let newValues = { ...values };
                    values["balloonQuery"] === "Approve"
                      ? approveToken(values["ApproveAddress"], values["approveAmount"])
                      : getBalance(values["ApproveAddress"]);
                    setValues(newValues);
                  }}
                >
                  {values["balloonQuery"]}
                </Button>
              </div>
              <div>{values["approveOutput"] && "🎈 " + values["approveOutput"]}</div>
            </div>
          </Card>
        </div>

        <div className="items operation stake">
          <Card style={{ height: "100%" }} title="Stake">
            <div style={{ padding: 8 }}>
              <Select
                showSearch
                defaultValue={values["stake"]}
                style={{ width: "100%" }}
                onChange={e => {
                  let newValues = { ...values };
                  newValues["stake"] = e;
                  console.log(newValues);
                  setValues(newValues);
                }}
              >
                <Select.Option value="Deposit">Deposit</Select.Option>
                <Select.Option value="Withdraw">Withdraw</Select.Option>
              </Select>
            </div>
            <div style={{ padding: 8 }}>
              <Input
                style={{ textAlign: "center" }}
                placeholder={"Ξ amount"}
                value={values["stakeAmount"]}
                onChange={e => {
                  let newValues = { ...values };
                  newValues["stakeAmount"] = e.target.value;
                  console.log(newValues);
                  setValues(newValues);
                }}
              />
            </div>
            <div style={{ padding: 8 }}>
              <Button
                style={{ width: "100%" }}
                type={"primary"}
                onClick={() => {
                  values["stake"] === "Deposit" ? deposit(values["stakeAmount"]) : withdraw(values["stakeAmount"]);
                  let newValues = { ...values };
                  newValues["stakeAmount"] = "";
                  setValues(newValues);
                }}
              >
                {values["stake"]}
              </Button>
            </div>
          </Card>
        </div>
      </div>

      <div className="box graph">
        <div style={{ padding: 20 }}>
          <Curve
            style={{ height: "100%" }}
            addingEth={
              values && values["exchange"] && values["exchange"] === "ETH" && values["exchangeValue"]
                ? values["exchangeValue"]
                : 0
            }
            addingToken={
              values && values["exchange"] && values["exchange"] === "Balloons" && values["exchangeValue"]
                ? values["exchangeValue"]
                : 0
            }
            ethReserve={ethBalanceFloat}
            tokenReserve={tokenBalanceFloat}
            width={400}
            height={500}
          />
        </div>
      </div>

      <div className="box contract-data">
        <div className="items account">
          <Card style={{ height: "100%" }} title="Account">
            <div>
              <TokenBalance name={"Balloons"} img={"🎈"} address={props.address} contracts={props.readContracts} />
            </div>
            <div>
              <h3>
                💦💦: <TokenBalance balance={userLiquidity} />{" "}
              </h3>
            </div>
          </Card>
        </div>

        <div className="items contract dex-contract">
          <Card style={{ height: "100%" }} title="Dex">
            <div className="box contract-dex">
              <div style={{ padding: 8 }}>
                <Address value={contractAddress} />
              </div>
              <div style={{ fontSize: 24 }}>
                <div>Ξ{parseFloat(ethers.utils.formatEther(contractBalance)).toFixed(4)}</div>
                <div>⚖️</div>
                <div>
                  <TokenBalance name={tokenName} img={"🎈"} address={contractAddress} contracts={props.readContracts} />
                </div>
              </div>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}

// const rowForm = (title, icon, onClick) => {
//   return (
//     <Row>
//       <Col span={8} style={{ textAlign: "right", opacity: 0.333, paddingRight: 6, fontSize: 24 }}>
//         {title}
//       </Col>
//       <Col span={16}>
//         <div style={{ cursor: "pointer", margin: 2 }}>
//           <Input
//             onChange={e => {
//               let newValues = { ...values };
//               newValues[title] = e.target.value;
//               setValues(newValues);
//             }}
//             value={values[title]}
//             addonAfter={
//               <div
//                 type="default"
//                 onClick={() => {
//                   onClick(values[title]);
//                   let newValues = { ...values };
//                   newValues[title] = "";
//                   setValues(newValues);
//                 }}
//               >
//                 {icon}
//               </div>
//             }
//           />
//         </div>
//       </Col>
//     </Row>
//   );
// };

// if (props.readContracts && props.readContracts[contractName]) {
//   display.push(
//     <div>
//       {rowForm("ethToToken", "💸", async value => {
//         let valueInEther = ethers.utils.parseEther("" + value);
//         let swapEthToTokenResult = await tx(writeContracts[contractName]["ethToToken"]({ value: valueInEther }));
//         console.log("swapEthToTokenResult:", swapEthToTokenResult);
//       })}

//       {rowForm("tokenToEth", "🔏", async value => {
//         let valueInEther = ethers.utils.parseEther("" + value);
//         console.log("valueInEther", valueInEther);
//         let allowance = await props.readContracts[tokenName].allowance(
//           props.address,
//           props.readContracts[contractName].address,
//         );
//         console.log("allowance", allowance);

//         let approveTx;
//         if (allowance.lt(valueInEther)) {
//           approveTx = await tx(
//             writeContracts[tokenName].approve(props.readContracts[contractName].address, valueInEther, {
//               gasLimit: 200000,
//             }),
//           );
//         }

//         let swapTx = tx(writeContracts[contractName]["tokenToEth"](valueInEther, { gasLimit: 200000 }));
//         if (approveTx) {
//           console.log("waiting on approve to finish...");
//           let approveTxResult = await approveTx;
//           console.log("approveTxResult:", approveTxResult);
//         }
//         let swapTxResult = await swapTx;
//         console.log("swapTxResult:", swapTxResult);
//       })}

//       <Divider> Liquidity ({liquidity ? ethers.utils.formatEther(liquidity) : "none"}):</Divider>

//       {rowForm("deposit", "📥", async value => {
//         let valueInEther = ethers.utils.parseEther("" + value);
//         let valuePlusExtra = ethers.utils.parseEther("" + value * 1.03);
//         console.log("valuePlusExtra", valuePlusExtra);
//         let allowance = await props.readContracts[tokenName].allowance(
//           props.address,
//           props.readContracts[contractName].address,
//         );
//         console.log("allowance", allowance);
//         if (allowance.lt(valuePlusExtra)) {
//           await tx(
//             writeContracts[tokenName].approve(props.readContracts[contractName].address, valuePlusExtra, {
//               gasLimit: 200000,
//             }),
//           );
//         }
//         await tx(writeContracts[contractName]["deposit"]({ value: valueInEther, gasLimit: 200000 }));
//       })}

//       {rowForm("withdraw", "📤", async value => {
//         let valueInEther = ethers.utils.parseEther("" + value);
//         let withdrawTxResult = await tx(writeContracts[contractName]["withdraw"](valueInEther));
//         console.log("withdrawTxResult:", withdrawTxResult);
//       })}
//     </div>,
//   );
// }

// return (
//   <Row span={24}>
//     <Col span={12}>
//       <Card
//         title={
//           <div>
//             <Address value={contractAddress} />
//             <div style={{ float: "right", fontSize: 24 }}>
//               {parseFloat(ethers.utils.formatEther(contractBalance)).toFixed(4)} ⚖️
//               <TokenBalance name={tokenName} img={"🎈"} address={contractAddress} contracts={props.readContracts} />
//             </div>
//           </div>
//         }
//         size="large"
//         loading={false}
//       >
//         {display}
//       </Card>
//       <Row span={12}>
//         <Contract
//           name="Balloons"
//           signer={props.signer}
//           provider={props.localProvider}
//           show={["balanceOf", "approve"]}
//           address={props.address}
//           blockExplorer={props.blockExplorer}
//           contractConfig={props.contractConfig}
//         />
//       </Row>
//     </Col>
//     <Col span={12}>
//
//     </Col>
//   </Row>
