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

  const [yourCollectibleSVG, setYourCollectibleSVG] = useState();
  const [yourPreviewSVG, setPreviewSVG] = useState();
  const [yourAccesories, setYourAccesories] = useState();
  const [previewAccesory, setPreviewAccesory] = useState({});
  const [previewOperation, setPreviewOperation] = useState({});

  console.log("🤗 priceToMint:", priceToMint);

  useEffect(() => {
    const updatePreview = async () => {
      if (yourCollectibleSVG) {
        const tokenId = collectibleId;
        console.log("tokenId: " + tokenId);
        const svg = readContracts[ContractName] && (await readContracts[ContractName].renderTokenById(tokenId));
        let accesorySVG = "";
        for (const accesory in previewAccesory) {
          accesorySVG +=
            readContracts[accesory] && (await readContracts[accesory].renderTokenById(previewAccesory[accesory]));
        }
        const newPreviewSVG =
          '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300" height="300" viewBox="0 0 880 880">' +
          accesorySVG +
          svg +
          "</svg>";
        setPreviewSVG(newPreviewSVG);
      }
    };
    updatePreview();
  }, [previewAccesory]);

  const AddPreviewAccesory = (accesoryType, accesoryId) => {
    const newPreviewAccesory = { ...previewAccesory };
    newPreviewAccesory[accesoryType] = accesoryId;
    setPreviewAccesory(newPreviewAccesory);
  };

  const RemovePreviewAccesory = accesoryType => {
    const newPreviewAccesory = { ...previewAccesory };
    delete newPreviewAccesory[accesoryType];
    setPreviewAccesory(newPreviewAccesory);
  };

  const updatePreviewOperation = (accesoryType, operation) => {};

  useEffect(() => {
    const updateYourCollectibleSVG = async () => {
      try {
        console.log("Getting token index " + collectibleId);
        const tokenId = collectibleId;
        console.log("tokenId: " + tokenId);
        const svg = readContracts[ContractName] && (await readContracts[ContractName].renderTokenById(tokenId));
        const newYourCollectibleSVG =
          '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300" height="300" viewBox="0 0 880 880">' +
          svg +
          "</svg>";
        setYourCollectibleSVG(newYourCollectibleSVG);
      } catch (err) {
        console.log(err);
      }
    };
    if (address) {
      updateYourCollectibleSVG();
    }
  }, [ContractName, address, collectibleId, readContracts]);

  useEffect(() => {
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
      updateYourAccesories();
    }
  }, [accesories, address, readContracts, selectedAccesory]);

  return (
    <div
      style={{ Width: "100%", display: "flex", flexWrap: "wrap", alignItems: "top", justifyContent: "space-between" }}
    >
      <div style={{ flex: 1, margin: "32px auto auto auto" }}>
        {yourCollectibleSVG && (
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
            <div
              style={{ marginBottom: "10px", width: "100%", height: "100%" }}
              dangerouslySetInnerHTML={{ __html: yourPreviewSVG ? yourPreviewSVG : yourCollectibleSVG }}
            ></div>
            <div>
              <Button onClick={() => {}}>Upgrade</Button>
            </div>
          </div>
        )}
        {previewAccesory && (
          <div style={{ Width: "100%", display: "flex", justifyContent: "center" }}>
            {Object.keys(previewAccesory).map(accesory => {
              return (
                <Select
                  style={{
                    width: 120,
                    margin: 2,
                  }}
                  defaultValue={previewOperation[accesory]}
                  onChange={value => {
                    value === String("stop")
                      ? RemovePreviewAccesory(accesory)
                      : updatePreviewOperation(accesory, value);
                  }}
                >
                  <Select.Option value="wear">✔ {accesory}</Select.Option>
                  <Select.Option value="remove">🔥 {accesory}</Select.Option>
                  <Select.Option value="stop">❌ Preview</Select.Option>
                </Select>
              );
            })}
          </div>
        )}
      </div>
      <div style={{ flex: 3, margin: "32px auto auto auto" }}>
        <div style={{ Width: "100%", margin: "auto" }}>
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

        <div style={{ Width: "100%", display: "flex", flexWrap: "wrap", justifyContent: "center" }}>
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
                    <Button
                      onClick={() => {
                        AddPreviewAccesory(selectedAccesory, id);
                      }}
                    >
                      ➕
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
