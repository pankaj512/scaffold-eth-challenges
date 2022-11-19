import { Button, Select, Switch } from "antd";
import React, { useState, useEffect } from "react";
import { Address, AddressInput } from "../components";
import { ethers } from "ethers";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Accesories({
  userSigner,
  readContracts,
  writeContracts,
  tx,
  loadWeb3Modal,
  blockExplorer,
  mainnetProvider,
  address,
  accesories,
  DEBUG,
}) {
  DEBUG && console.log("Accesories: ", accesories);
  const [transferToAddresses, setTransferToAddresses] = useState({});
  const [selectedAccesory, setSelectedAccesory] = useState(accesories[0]);
  DEBUG && console.log("selected Accesory: ", selectedAccesory);

  // 🧠 This effect will update Accesory by polling when your balance changes
  const [priceToMint, setPriceToMint] = useState();

  const [showMineTokenOnly, setShowMineTokenOnly] = useState(false);

  useEffect(() => {
    const fetchPrice = async () => {
      const priceToMint = readContracts[selectedAccesory] && (await readContracts[selectedAccesory].price());
      if (priceToMint) {
        setPriceToMint(priceToMint);
      }
    };
    fetchPrice();
  }, [address, readContracts, selectedAccesory]);

  const [yourCollectibles, setYourCollectibles] = useState();
  DEBUG && console.log("🤗 priceToMint:", priceToMint);

  useEffect(() => {
    const updateYourCollectibles = async () => {
      const collectibleUpdate = [];
      for (let accesory = 0; accesory < accesories.length; accesory++) {
        let balance = 0;
        if (showMineTokenOnly) {
          balance =
            readContracts[accesories[accesory]] && (await readContracts[accesories[accesory]].balanceOf(address));
        } else {
          balance = readContracts[accesories[accesory]] && (await readContracts[accesories[accesory]].totalSupply());
        }
        DEBUG && console.log("Accessories ", accesories[accesory], " Balance: ", balance);

        for (let tokenIndex = 0; tokenIndex < balance; ++tokenIndex) {
          try {
            DEBUG && console.log("Getting token index " + tokenIndex);
            let tokenId = 0;
            if (showMineTokenOnly) {
              tokenId =
                readContracts[accesories[accesory]] &&
                (await readContracts[accesories[accesory]].tokenOfOwnerByIndex(address, tokenIndex));
            } else {
              tokenId =
                readContracts[accesories[accesory]] &&
                (await readContracts[accesories[accesory]].tokenByIndex(tokenIndex));
            }
            DEBUG && console.log("tokenId: " + tokenId);
            const tokenURI =
              readContracts[accesories[accesory]] && (await readContracts[accesories[accesory]].tokenURI(tokenId));
            DEBUG && console.log("tokenURI: " + tokenURI);
            const jsonManifestString = Buffer.from(tokenURI.substring(29), "base64").toString();
            DEBUG && console.log("jsonManifestString: " + jsonManifestString);

            try {
              const jsonManifest = JSON.parse(jsonManifestString);
              DEBUG && console.log("jsonManifest: " + jsonManifest);
              collectibleUpdate.push({ id: tokenId, uri: tokenURI, owner: address, ...jsonManifest });
            } catch (err) {
              DEBUG && console.log(err);
            }
          } catch (err) {
            DEBUG && console.log(err);
          }
        }
      }
      setYourCollectibles(collectibleUpdate.reverse());
    };
    if (address) updateYourCollectibles();
  }, [accesories, DEBUG, address, readContracts, showMineTokenOnly]);

  return (
    <div>
      <div
        style={{
          display: "flex",
          maxWidth: 1800,
          margin: "auto",
          marginTop: 32,
          paddingBottom: 32,
          justifyContent: "center",
        }}
      >
        {userSigner ? (
          <div>
            <Select
              style={{
                width: 120,
                margin: 10,
              }}
              defaultValue={selectedAccesory}
              onChange={value => {
                DEBUG && console.log("🤗 setSelectedAccesory:", value);
                setSelectedAccesory(value);
              }}
            >
              {accesories.map(accesory => (
                <Select.Option value={accesory}>{accesory}</Select.Option>
              ))}
            </Select>

            <Button
              type={"primary"}
              onClick={async () => {
                const priceRightNow =
                  readContracts[selectedAccesory] && (await readContracts[selectedAccesory].price());
                DEBUG && console.log("🤗 priceRightNow:", priceRightNow);
                try {
                  tx(
                    writeContracts[selectedAccesory] &&
                      writeContracts[selectedAccesory].mintItem({ value: priceRightNow }),
                    function (transaction) {},
                  );
                } catch (e) {
                  DEBUG && console.log("mint failed", e);
                }
              }}
            >
              MINT {selectedAccesory} for Ξ{priceToMint && (+ethers.utils.formatEther(priceToMint)).toFixed(4)}s
            </Button>
          </div>
        ) : (
          <Button type={"primary"} onClick={loadWeb3Modal}>
            CONNECT WALLET
          </Button>
        )}
        <div style={{ margin: 10 }}>
          {showMineTokenOnly ? "Mine " : "All "}
          <Switch
            checked={showMineTokenOnly}
            onChange={() => {
              setShowMineTokenOnly(!showMineTokenOnly);
            }}
          />
        </div>
      </div>

      <div style={{ maxWidth: 1800, display: "flex", flexWrap: "wrap", margin: "auto" }}>
        {yourCollectibles &&
          yourCollectibles.map(nft => {
            const id = nft.id.toNumber();
            return (
              <div
                style={{
                  minWidth: "200px",
                  minHeight: "200px",
                  width: "100px",
                  height: "100%",
                  margin: "1%",
                  padding: "10px",
                  border: "1px solid",
                }}
              >
                <div>{nft.name}</div>
                <div>
                  <a
                    href={
                      "https://opensea.io/assets/" +
                      (readContracts && readContracts[selectedAccesory] && readContracts[selectedAccesory].address) +
                      "/" +
                      nft.id
                    }
                    target="_blank"
                    rel="noreferrer"
                  >
                    <img width="100%" height="100%" src={nft.image} alt={nft.description} />
                  </a>
                </div>
                <div style={{ marginBottom: "10px" }}>{nft.description}</div>
                <div>
                  owner:{" "}
                  <Address
                    address={nft.owner}
                    ensProvider={mainnetProvider}
                    blockExplorer={blockExplorer}
                    fontSize={16}
                  />
                  <AddressInput
                    ensProvider={mainnetProvider}
                    placeholder="transfer to address"
                    value={transferToAddresses[id]}
                    onChange={newValue => {
                      const update = {};
                      update[id] = newValue;
                      setTransferToAddresses({ ...transferToAddresses, ...update });
                    }}
                  />
                  <Button
                    onClick={() => {
                      tx(
                        writeContracts[selectedAccesory] &&
                          writeContracts[selectedAccesory].transferFrom(address, transferToAddresses[id], id),
                      );
                    }}
                  >
                    Transfer
                  </Button>
                </div>
              </div>
            );
          })}
      </div>

      {/* <div style={{ margin: "auto", paddingBottom: 256 }}>
        <List
          bordered
          dataSource={yourCollectibles}
          renderItem={item => {
            const id = item.id.toNumber();

            DEBUG && console.log("IMAGE", item.image);

            return (
              <List.Item key={id + "_" + item.uri + "_" + item.owner}>
                <div style={{ display: "inline", width: "400px" }}>
                  <div>
                    <Card
                      title={
                        <div>
                          <span style={{ fontSize: 18, marginRight: 8 }}>{item.name}</span>
                        </div>
                      }
                    >
                      <a
                        href={
                          "https://opensea.io/assets/" +
                          (readContracts && readContracts.YourCollectible && readContracts.YourCollectible.address) +
                          "/" +
                          item.id
                        }
                        target="_blank"
                        rel="noreferrer"
                      >
                        <img src={item.image} alt={item.description} />
                      </a>
                      <div style={{ display: "inline" }}>{item.description}</div>
                    </Card>
                  </div>

                  <div>
                    owner:{" "}
                    <Address
                      address={item.owner}
                      ensProvider={mainnetProvider}
                      blockExplorer={blockExplorer}
                      fontSize={16}
                    />
                    <AddressInput
                      ensProvider={mainnetProvider}
                      placeholder="transfer to address"
                      value={transferToAddresses[id]}
                      onChange={newValue => {
                        const update = {};
                        update[id] = newValue;
                        setTransferToAddresses({ ...transferToAddresses, ...update });
                      }}
                    />
                    <Button
                      onClick={() => {
                        DEBUG && console.log("writeContracts", writeContracts);
                        tx(writeContracts.YourCollectible.transferFrom(address, transferToAddresses[id], id));
                      }}
                    >
                      Transfer
                    </Button>
                  </div>
                </div>
              </List.Item>
            );
          }}
        />
      </div> */}
    </div>
  );
}

export default Accesories;
