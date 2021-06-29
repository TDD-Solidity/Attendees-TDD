// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract Attendees {
    
    enum TShirtSize { SMALL, MEDIUM, LARGE, X_LARGE, XX_LARGE }

    struct AttendeeInfo {
      string displayName;
      uint tShirtSize;
      bool isGrandPrizeWinner;
    }

    address public owner = msg.sender;

    address[] private attendees;

    address[] private recipientAddresses;

    uint[] private shares;

    uint attendeesCount;

    mapping(address => AttendeeInfo) attendeeToInfo;

    address DEV_TEAM_ADDRESS = "0x1231231342345234";

    PaymentSplitter paymentSplitter;

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function declareAttendance(string memory displayName, uint shirtSize) public {
      
      // TODO - require that the caller address was not banned.


      attendees.push(msg.sender);
      recipientAddresses.push(msg.sender);
      attendeeToInfo[msg.sender] = AttendeeInfo(displayName, shirtSize, false);

      shares.push(1);

      attendeesCount++;
    }

    function getMyInfo() public view returns (AttendeeInfo memory) {
      return attendeeToInfo[msg.sender];
    }

    function getAllAttendees() public view returns (address[] memory) {
      return attendees;
    }

    function initiateAirdrop() public restricted {

      uint equalShares = [];

      for (i; i < attendeesCount; i++) {
        equalShares.push(1);
      }

      paymentSplitter = PaymentSplitter(attendees, equalShares);

    }

    function spinGiveawayWheel() public restricted {

      // all nonwinners have one share
      
      uint devTeamPercentage = 5;
      uint winnerPercentage = 20;

      uint devTeamShares = devTeamPercentage * (attendeesCount - 1) / 
        (1 - devdevTeamPercentage - winnerPercentage);

      uint winnerShares = winnerPercentage * (attendeesCount - 1) / 
        (1 - devdevTeamPercentage - winnerPercentage);

      // TODO  - use chainlink VRF or something similar to get a 
      //         random integer between 0 and attendeeCount - 1 

      uint randomlyChosenUint = 1;

      shares[randomlyChosenUint] = winnerShares;
      
      attendeeToInfo[recipientAddresses[randomlyChosenUint]].isGrandPrizeWinner = true;

      // push dev team address into array AFTER a winner is chosen...

      recipientAddresses.push(DEV_TEAM_ADDRESS);
      shares.push(devTeamShares);

      paymentSplitter = PaymentSplitter(recipientAddresses, shares);

    }

    function pullPayment() public {
      paymentSplitter.release(msg.sender);
      // paymentSplitter.claim(msg.sender);
    }

}
