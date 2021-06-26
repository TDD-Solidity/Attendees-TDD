// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Attendees {
    
    enum TShirtSize { SMALL, MEDIUM, LARGE, X_LARGE, XX_LARGE }

    struct AttendeeInfo {
      string displayName;
      uint tShirtSize;
    }

    address public owner = msg.sender;

    address[] private attendees;

    mapping(address => AttendeeInfo) attendeeToInfo;

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function declareAttendance(string memory displayName, uint shirtSize) public {

      attendees.push(msg.sender);

      attendeeToInfo[msg.sender] = AttendeeInfo(displayName, shirtSize);
    }

    function getMyInfo() public view returns (AttendeeInfo memory) {

      return attendeeToInfo[msg.sender];

    }

    function getAllAttendees() public view returns (address[] memory) {
      return attendees;
    }
}
