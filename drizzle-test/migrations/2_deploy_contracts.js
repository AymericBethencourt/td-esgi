const SimpleStorage = artifacts.require("SimpleStorage");
const MyToken = artifacts.require("MyToken");
const HelloWorld = artifacts.require("HelloWorld");
const Lottery = artifacts.require("Lottery");
const MyGame = artifacts.require("MyGame");
const ShipBattle = artifacts.require("ShipBattle");

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
  deployer.deploy(SimpleStorage, 42);
  deployer.deploy(Lottery);
  deployer.deploy(MyToken);
  deployer.deploy(MyGame);
  deployer.deploy(ShipBattle);
};
