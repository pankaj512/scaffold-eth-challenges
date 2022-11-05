import { Button, List, Card } from "antd";
import React, { useState, useEffect } from "react";
import { Address, AddressInput } from "../components";
import { useContractReader } from "eth-hooks";
import { ethers } from "ethers";
import { useHistory } from "react-router-dom";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Home({
  userSigner,
  readContracts,
  writeContracts,
  tx,
  loadWeb3Modal,
  blockExplorer,
  mainnetProvider,
  address,
  setSelectedCollectible,
  ContractName,
}) {
  const [transferToAddresses, setTransferToAddresses] = useState({});
  const history = useHistory();

  // 🧠 This effect will update yourCollectibles by polling when your balance changes
  const balanceContract = useContractReader(readContracts, ContractName, "balanceOf", [address]);
  const [balance, setBalance] = useState();

  const priceToMint = useContractReader(readContracts, ContractName, "price");
  console.log("🤗 priceToMint:", priceToMint);

  useEffect(() => {
    if (balanceContract) {
      setBalance(balanceContract);
    }
  }, [balanceContract]);

  const [yourCollectibles, setYourCollectibles] = useState();

  console.log("Home: " + address + ", Balance: " + balance);

  useEffect(() => {
    const updateYourCollectibles = async () => {
      const collectibleUpdate = [];
      for (let tokenIndex = 0; tokenIndex < balance; ++tokenIndex) {
        try {
          console.log("Getting token index " + tokenIndex);
          const tokenId =
            readContracts[ContractName] && (await readContracts[ContractName].tokenOfOwnerByIndex(address, tokenIndex));
          console.log("tokenId: " + tokenId);
          const tokenURI = readContracts[ContractName] && (await readContracts[ContractName].tokenURI(tokenId));
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
      setYourCollectibles(collectibleUpdate.reverse());
    };
    if (address && balance) updateYourCollectibles();
  }, [address, balance, readContracts.YourCollectible]);

  return (
    <div>
      <div style={{ maxWidth: 1800, margin: "auto", marginTop: 32, paddingBottom: 32 }}>
        {userSigner ? (
          <Button
            type={"primary"}
            onClick={async () => {
              const priceRightNow = readContracts[ContractName] && (await readContracts[ContractName].price());
              try {
                tx(writeContracts[ContractName].mintItem({ value: priceRightNow }), function (transaction) {});
              } catch (e) {
                console.log("mint failed", e);
              }
            }}
          >
            MINT Parrot for Ξ{priceToMint && (+ethers.utils.formatEther(priceToMint)).toFixed(4)}s
          </Button>
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
                  width: "18%",
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
                      (readContracts && readContracts.YourCollectible && readContracts.YourCollectible.address) +
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
                      tx(writeContracts[ContractName].transferFrom(address, transferToAddresses[id], id));
                    }}
                    s
                  >
                    Transfer
                  </Button>
                </div>
                <div>
                  <Button
                    style={{ margin: "10px" }}
                    onClick={() => {
                      // tx(writeContracts[ContractName].transferFrom(address, transferToAddresses[id], id));
                      setSelectedCollectible(id);
                      history.push("/preview");
                    }}
                  >
                    Upgrade/Degrade
                  </Button>
                </div>
              </div>
            );
          })}
      </div>
    </div>
  );
}

export default Home;
