import Web3 from "web3";

import Lottery from "./contracts/Lottery.json";
import SimpleStorage from "./contracts/SimpleStorage.json";
import MyToken from "./contracts/MyToken.json";
import HelloWorld from "./contracts/HelloWorld.json";
import MyGame from "./contracts/MyGame.json";
import ShipBattle from "./contracts/ShipBattle.json";

const options = {
  web3: {
    block: false,
    customProvider: new Web3("ws://localhost:7545"),
    networkWhitelist: [
      1, // Mainnet
      3, // Ropsten
      4, // Rinkeby
      5, // Goerli
      42 // Kovan
    ]
  },
  contracts: [SimpleStorage, Lottery, MyToken, HelloWorld, MyGame, ShipBattle],
  events: {
    SimpleStorage: ["StorageSet"]
  }
};

export default options;
