// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract Attendees {
    
    enum TShirtSize { SMALL, MEDIUM, LARGE, X_LARGE, XX_LARGE }

    struct AttendeeInfo {
      string displayName;
      uint tShirtSize;
    }

    address public owner = msg.sender;

    address[] private attendees;

    uint attendeesCount;

    mapping(address => AttendeeInfo) attendeeToInfo;

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
      attendeeToInfo[msg.sender] = AttendeeInfo(displayName, shirtSize);

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

    function pullPayment() public {
      paymentSplitter.release(msg.sender);
      // paymentSplitter.claim(msg.sender);
    }

}
