import React, { useState, useEffect } from "react";
import { Button, List } from "antd";

import { Address, Balance, Blockie, TransactionDetailsModal } from "../components";
import { EllipsisOutlined } from "@ant-design/icons";
import { parseEther, formatEther } from "@ethersproject/units";
import { parseExternalContractTransaction } from "../helpers";

const TransactionListItem = function ({
  item,
  mainnetProvider,
  blockExplorer,
  price,
  readContracts,
  contractName,
  children,
}) {
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [txnData, setTxnData] = useState(null);

  useEffect(() => {
    if (!txnData) {
      try {
        const parsedData = item.data !== "0x" ? readContracts[contractName].interface.parseTransaction(item) : null;
        setTxnData(parsedData);
      } catch (argumentError) {
        console.log("ERROR", argumentError);

        const getParsedTransaction = async () => {
          const parsedTransaction = await parseExternalContractTransaction(item.to, item.data);
          setTxnData(parsedTransaction);
        };

        getParsedTransaction();
      }
    }
  }, [item]);

  const showModal = () => {
    setIsModalVisible(true);
  };

  const handleOk = () => {
    setIsModalVisible(false);
  };

  console.log("🔥🔥🔥🔥", item);
  console.log("🔥🔥🔥🔥", txnData);

  return (
    <>
      <TransactionDetailsModal
        visible={isModalVisible}
        txnInfo={txnData}
        handleOk={handleOk}
        mainnetProvider={mainnetProvider}
        price={price}
      />
      {txnData && (
        <div style={{ width: "100%" }}>
          <div style={{ display: "flex", justifyContent: "space-between" }}>
            <span>{<b>#{typeof item.nonce === "number" ? item.nonce : item.nonce.toNumber()}</b>}</span>
            <span>
              <b>Event Name :&nbsp;</b>
              <p>{txnData.functionFragment.name}&nbsp;</p>
            </span>

            <span>
              <p>Tansaction Hash</p>
              <Blockie size={4} scale={8} address={item.hash} /> {item.hash.substr(0, 6)}
            </span>
            <span>
              <p>Address to</p>
              <Address address={item.to} ensProvider={mainnetProvider} blockExplorer={blockExplorer} fontSize={16} />
            </span>
            <span>
              <p>Value Passed</p>
              <Balance
                balance={item.value ? item.value : parseEther("" + parseFloat(item.amount).toFixed(12))}
                dollarMultiplier={price}
              />
            </span>
            <span>{children}</span>
            <span>
              <Button onClick={showModal}>
                <EllipsisOutlined />
              </Button>
            </span>
          </div>
        </div>
      )}
    </>
  );
};
export default TransactionListItem;
