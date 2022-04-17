import { React, useState, useEffect } from "react";
import { Table } from "antd";
import { Address, Balance, Blockie, TransactionDetailsModal } from "../components";
import { parseEther, formatEther } from "@ethersproject/units";

function MultSigEvent({
  contractName,
  readContracts,
  executeTransactionEvents,
  mainnetProvider,
  blockExplorer,
  price,
}) {
  const columns = [
    {
      title: "Method",
      dataIndex: "method",
      key: "method",
    },
    {
      title: "Executor",
      dataIndex: "owner",
      key: "owner",
      render: text => (
        <Address address={text} ensProvider={mainnetProvider} blockExplorer={blockExplorer} fontSize={16} />
      ),
    },
    {
      title: "To",
      dataIndex: "to",
      key: "to",
      render: text => (
        <Address address={text} ensProvider={mainnetProvider} blockExplorer={blockExplorer} fontSize={16} />
      ),
    },
    {
      title: "Nonce",
      dataIndex: "nonce",
      key: "nonce",
      render: text => <span>{<b>#{typeof text === "number" ? text : text.toNumber()}</b>}</span>,
      defaultSortOrder: "descend",
      sorter: (a, b) => a.nonce - b.nonce,
    },
    {
      title: "Tx Hash",
      dataIndex: "txHash",
      key: "txHash",
      render: text => (
        <span>
          <Address address={text} ensProvider={mainnetProvider} blockExplorer={blockExplorer} fontSize={16} />
        </span>
      ),
    },
    {
      title: "Data",
      dataIndex: "callData",
      key: "callData",
      render: text => <span>{text?.substr(0, 8) + "..." + text?.substr(-8)}</span>,
    },
    {
      title: "Value",
      dataIndex: "value",
      key: "value",
      render: text => <Balance balance={parseEther("" + parseFloat(text).toFixed(12))} dollarMultiplier={price} />,
    },
  ];

  const [executionEvents, setExecutionEvents] = useState();

  useEffect(() => {
    if (executeTransactionEvents) {
      const events = [];
      for (const event of executeTransactionEvents) {
        let txnData;
        try {
          txnData = readContracts[contractName].interface.parseTransaction(event.args);
        } catch (error) {
          console.log("ERROR", error);
        }
        const eventObj = {
          method: txnData && txnData.functionFragment ? txnData.functionFragment.name : "Default",
          owner: event.args[0],
          to: event.args[1],
          nonce: event.args[4],
          txHash: event.args[5],
          callData: event.args[3],
          value: event.args[2],
        };
        events.push(eventObj);
      }
      setExecutionEvents(events);
    }
  });

  return (
    <div className="history">
      <div className="history-item">
        <h2>Executed Transactions</h2>
      </div>
      <div className="history-item">
        <Table dataSource={executionEvents} columns={columns} />
      </div>
    </div>
  );
}

export default MultSigEvent;
