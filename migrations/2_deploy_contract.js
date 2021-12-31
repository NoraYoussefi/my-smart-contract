const myContract = artifacts.require("./myContract.sol");

module.exports = function(deployer) {
  deployer.deploy(myContract);
};
