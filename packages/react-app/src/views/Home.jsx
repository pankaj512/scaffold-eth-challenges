import { Button, List, Card } from "antd";
import React, { useState, useEffect } from "react";
import { Address, AddressInput } from "../components";
import { useContractReader } from "eth-hooks";

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
}) {
  const [transferToAddresses, setTransferToAddresses] = useState({});

  // 🧠 This effect will update yourCollectibles by polling when your balance changes
  const balanceContract = useContractReader(readContracts, "YourCollectible", "balanceOf", [address]);
  const [balance, setBalance] = useState();

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
          const tokenId = await readContracts.YourCollectible.tokenOfOwnerByIndex(address, tokenIndex);
          console.log("tokenId: " + tokenId);
          const tokenURI = await readContracts.YourCollectible.tokenURI(tokenId);
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
  }, [address, balance]);

  return (
    <div>
      <div style={{ maxWidth: 820, margin: "auto", marginTop: 32, paddingBottom: 32 }}>
        {userSigner ? (
          <Button
            type={"primary"}
            onClick={() => {
              tx(writeContracts.YourCollectible.mintItem());
            }}
          >
            MINT
          </Button>
        ) : (
          <Button type={"primary"} onClick={loadWeb3Modal}>
            CONNECT WALLET
          </Button>
        )}
      </div>

      <div style={{ display: "flex", flexWrap: "wrap", margin: "auto" }}>
        {yourCollectibles &&
          yourCollectibles.map(nft => {
            const id = nft.id.toNumber();
            return (
              <div style={{ flex: 1, margin: "10px", padding: "10px", border: "1px solid" }}>
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
                    <img src={nft.image} alt={nft.description} />
                  </a>
                </div>
                <div style={{ marginBottom: "10px" }}>{nft.description}</div>
                <div >
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
                      tx(writeContracts.YourCollectible.transferFrom(address, transferToAddresses[id], id));
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

export default Home;
