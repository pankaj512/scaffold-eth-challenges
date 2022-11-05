import { Button, List, Card, Select } from "antd";
import React, { useState, useEffect } from "react";
import { Address, AddressInput } from "../components";
import { useContractReader } from "eth-hooks";
import { ethers } from "ethers";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Preview({
  userSigner,
  readContracts,
  writeContracts,
  tx,
  loadWeb3Modal,
  blockExplorer,
  mainnetProvider,
  address,
  accesories,
  collectibleId,
  ContractName,
}) {
  console.log("collectibleId: ", collectibleId);
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

  const [yourCollectible, setYourCollectible] = useState();
  const [yourAccesories, setYourAccesories] = useState();
  console.log("🤗 priceToMint:", priceToMint);

  useEffect(() => {
    const updateYourCollectible = async () => {
      try {
        console.log("Getting token index " + collectibleId);
        const tokenId = collectibleId;
        console.log("tokenId: " + tokenId);
        const tokenURI = await readContracts[ContractName].tokenURI(tokenId);
        const jsonManifestString = Buffer.from(tokenURI.substring(29), "base64").toString();
        console.log("jsonManifestString: " + jsonManifestString);

        try {
          const jsonManifest = JSON.parse(jsonManifestString);
          console.log("jsonManifest: " + jsonManifest);
          setYourCollectible({ id: tokenId, uri: tokenURI, owner: address, ...jsonManifest });
        } catch (err) {
          console.log(err);
        }
      } catch (err) {
        console.log(err);
      }
    };

    const updateYourAccesories = async () => {
      const accesoriesUpdate = [];
      const balance = readContracts[selectedAccesory] && (await readContracts[selectedAccesory].balanceOf(address));
      for (let tokenIndex = 0; tokenIndex < balance; ++tokenIndex) {
        try {
          console.log("Getting token index " + tokenIndex);
          const tokenId =
            readContracts[selectedAccesory] &&
            (await readContracts[selectedAccesory].tokenOfOwnerByIndex(address, tokenIndex));
          console.log("tokenId: " + tokenId);
          const tokenURI = readContracts[selectedAccesory] && (await readContracts[selectedAccesory].tokenURI(tokenId));
          const jsonManifestString = Buffer.from(tokenURI.substring(29), "base64").toString();
          console.log("jsonManifestString: " + jsonManifestString);

          try {
            const jsonManifest = JSON.parse(jsonManifestString);
            console.log("jsonManifest: " + jsonManifest);
            accesoriesUpdate.push({ id: tokenId, uri: tokenURI, owner: address, ...jsonManifest });
          } catch (err) {
            console.log(err);
          }
        } catch (err) {
          console.log(err);
        }
      }
      setYourAccesories(accesoriesUpdate.reverse());
    };
    if (address) {
      updateYourCollectible();
      updateYourAccesories();
    }
  }, [ContractName, accesories, address, collectibleId, readContracts, selectedAccesory]);

  return (
    <div style={{ Width: "100%", display: "flex", flexWrap: "wrap", alignItems: "top" }}>
      <div style={{ margin: "auto", marginTop: 32, paddingBottom: 32 }}>
        {yourCollectible && (
          <div
            style={{
              minWidth: "200px",
              minHeight: "200px",
              width: "100%",
              height: "100%",
              margin: "1%",
              padding: "10px",
              border: "1px solid",
            }}
          >
            <div>{yourCollectible.name}</div>
            <div>
              <a
                href={
                  "https://opensea.io/assets/" +
                  (readContracts && readContracts[ContractName] && readContracts[ContractName].address) +
                  "/" +
                  yourCollectible.id
                }
                target="_blank"
                rel="noreferrer"
              >
                <img width="100%" height="100%" src={yourCollectible.image} alt={yourCollectible.description} />
              </a>
            </div>
            <div style={{ marginBottom: "10px" }}>{yourCollectible.description}</div>
            <div>
              owner:{" "}
              <Address
                address={yourCollectible.owner}
                ensProvider={mainnetProvider}
                blockExplorer={blockExplorer}
                fontSize={16}
              />
              <AddressInput
                ensProvider={mainnetProvider}
                placeholder="transfer to address"
                value={transferToAddresses[yourCollectible.id]}
                onChange={newValue => {
                  const update = {};
                  update[yourCollectible.id] = newValue;
                  setTransferToAddresses({ ...transferToAddresses, ...update });
                }}
              />
              <Button
                onClick={() => {
                  tx(
                    writeContracts[ContractName] &&
                      writeContracts[ContractName].transferFrom(
                        address,
                        transferToAddresses[yourCollectible.id],
                        yourCollectible.id,
                      ),
                  );
                }}
              >
                Transfer
              </Button>
            </div>
          </div>
        )}
      </div>
      <div style={{ marginLeft: "auto", marginRight: "auto", marginBottom: "auto" }}>
        <div style={{ Width: "100%", margin: "auto", marginTop: 32, paddingBottom: 32 }}>
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

        <div style={{ Width: "100%", display: "flex", flexWrap: "wrap", margin: "auto" }}>
          {yourAccesories &&
            yourAccesories.map(nft => {
              const id = nft.id.toNumber();
              return (
                <divs
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
                </divs>
              );
            })}
        </div>
      </div>
    </div>
  );
}

export default Preview;
