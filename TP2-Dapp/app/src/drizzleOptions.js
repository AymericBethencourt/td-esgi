import Web3 from "web3";

import HelloWorld from "./contracts/HelloWorld.json";

const options = {
  web3: {
    block: false,
    customProvider: new Web3("ws://localhost:8545"),
    networkWhitelist: [
      1, // Mainnet
      3, // Ropsten
      4, // Rinkeby
      5, // Goerli
      42, // Kovan
    ],
  },
  contracts: [HelloWorld],
  events: {
    SimpleStorage: ["StorageSet"],
  },
};

export default options;
