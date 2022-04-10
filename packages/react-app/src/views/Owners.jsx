import React, { useEffect, useState } from "react";
import { Select, List, Spin } from "antd";
import { Address } from "../components";
const { Option } = Select;

export default function Owners({ ownerEvents, signaturesRequired, mainnetProvider, blockExplorer }) {
  const [owners, setOwners] = useState([]);
  useEffect(
    owners => {
      const ownerAdded = ownerEvents.filter(event => {
        return event.args[1];
      });

      const ownerRemoved = ownerEvents.filter(event => {
        return event.args[1] === false;
      });

      const addedAddress = ownerAdded.map(owner => {
        return owner.args[0];
      });

      const removedAddress = ownerRemoved.map(owner => {
        return owner.args[0];
      });
      let update = owners ? owners : [];
      addedAddress && update.push(...addedAddress);
      update = update.filter(val => !removedAddress.includes(val));
      const unique = update.filter((v, i, a) => {
        return a.indexOf(v) === i;
      });
      setOwners(unique);
    },
    [ownerEvents],
  );

  return (
    <div className="OwnersPage">
      <div>
        <h2>Owners 🏠 </h2>
      </div>
      <div className="OwnerItems">
        <h2>Signatures Required: {signaturesRequired ? signaturesRequired.toNumber() : <Spin></Spin>}</h2>
        <List
          dataSource={owners}
          renderItem={item => {
            return (
              <List.Item key={"owner_" + item}>
                <Address address={item} ensProvider={mainnetProvider} blockExplorer={blockExplorer} fontSize={32} />
              </List.Item>
            );
          }}
        />
      </div>
    </div>
  );
}
