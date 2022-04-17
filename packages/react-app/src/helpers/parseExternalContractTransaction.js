import { ethers } from "ethers";

const axios = require("axios");

export default async function parseExternalContractTransaction(contractAddress, txData) {
  try {
    let response = await axios.get("https://api.etherscan.io/api", {
      params: {
        module: "contract",
        action: "getabi",
        address: contractAddress,
        apikey: "ZDQPJ1CFQMKU8UUWHAIXAPTCI51XZCYMXU",
      },
    });

    const getParsedTransaction = async () => {
      const abi = response?.data?.result;
      if (abi && txData && txData !== "") {
        const iface = new ethers.utils.Interface(JSON.parse(abi));
        return iface.parseTransaction({ data: txData });
      }
    };

    return await getParsedTransaction(response);
  } catch (error) {
    console.log("parseExternalContractTransaction error:", error);
  }
}
