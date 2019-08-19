const Migrations = artifacts.require("Migrations");
const VoterContract = artifacts.require("Voter");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(VoterContract);
};
