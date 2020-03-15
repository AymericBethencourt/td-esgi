import Web3 from "web3";

const options = {
  web3: {
    block: false,
    customProvider: new Web3("ws://localhost:8545"),
    networkWhitelist: [
      1, // Mainnet
      3, // Ropsten
      4, // Rinkeby
      5, // Goerli
      42 // Kovan
    ]
  },
  contracts: [],
  events: {
    SimpleStorage: ["StorageSet"]
  }
};

export default options;
