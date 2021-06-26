const Attendees = artifacts.require("Attendees");

module.exports = function (deployer) {
  deployer.deploy(Attendees);
};