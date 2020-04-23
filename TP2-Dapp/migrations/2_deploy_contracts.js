const HelloWorld = artifacts.require("HelloWorld");
const SimpleStorage = artifacts.require("SimpleStorage");
const Lottery = artifacts.require("Lottery");
const MyToken = artifacts.require("MyToken");

module.exports = function (deployer) {
  deployer.deploy(HelloWorld);
  deployer.deploy(SimpleStorage, 42);
  deployer.deploy(Lottery);
  deployer.deploy(MyToken);
};
