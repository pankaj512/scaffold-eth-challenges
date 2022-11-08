import { Button, Select } from "antd";
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
}) {
  console.log("Accesories: ", accesories);
  const [transferToAddresses, setTransferToAddresses] = useState({});
  const [selectedAccesory, setSelectedAccesory] = useState(accesories[0]);
  console.log("selected Accesory: ", selectedAccesory);

  // 🧠 This effect will update Accesory by polling when your balance changes
  const [priceToMint, setPriceToMint] = useState();

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
  console.log("🤗 priceToMint:", priceToMint);

  useEffect(() => {
    const updateYourCollectibles = async () => {
      const collectibleUpdate = [];
      for (let accesory = 0; accesory < accesories.length; accesory++) {
        const balance =
          readContracts[accesories[accesory]] && (await readContracts[accesories[accesory]].balanceOf(address));

        for (let tokenIndex = 0; tokenIndex < balance; ++tokenIndex) {
          try {
            console.log("Getting token index " + tokenIndex);
            const tokenId =
              readContracts[accesories[accesory]] &&
              (await readContracts[accesories[accesory]].tokenOfOwnerByIndex(address, tokenIndex));
            console.log("tokenId: " + tokenId);
            const tokenURI =
              readContracts[accesories[accesory]] && (await readContracts[accesories[accesory]].tokenURI(tokenId));
            console.log("tokenURI: " + tokenURI);
            const jsonManifestString = Buffer.from(tokenURI.substring(29), "base64").toString();
            console.log("jsonManifestString: " + jsonManifestString);

            try {
              const jsonManifest = JSON.parse(jsonManifestString);
              console.log("jsonManifest: " + jsonManifest);
              collectibleUpdate.push({ id: tokenId, uri: tokenURI, owner: address, ...jsonManifest });
            } catch (err) {
              console.log(err);
            }
          } catch (err) {
            console.log(err);
          }
        }
      }
      setYourCollectibles(collectibleUpdate.reverse());
    };
    if (address) updateYourCollectibles();
  }, [accesories, address, readContracts]);

  return (
    <div>
      <div style={{ maxWidth: 1800, margin: "auto", marginTop: 32, paddingBottom: 32 }}>
        {userSigner ? (
          <div>
            <Select
              style={{
                width: 120,
                margin: 10,
              }}
              defaultValue={selectedAccesory}
              onChange={value => {
                console.log("🤗 setSelectedAccesory:", value);
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
                console.log("🤗 priceRightNow:", priceRightNow);
                try {
                  tx(
                    writeContracts[selectedAccesory] &&
                      writeContracts[selectedAccesory].mintItem({ value: priceRightNow }),
                    function (transaction) {},
                  );
                } catch (e) {
                  console.log("mint failed", e);
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

            console.log("IMAGE", item.image);

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
                        console.log("writeContracts", writeContracts);
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
