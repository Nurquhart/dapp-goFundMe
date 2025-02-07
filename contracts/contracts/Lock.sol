// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

struct Fund {
    uint256 value;
    address owner;
}

contract Lock {
    // address payable public owner;
    mapping(string => Fund) public mapOfFunds;

    // constructor() payable {
    //     owner = payable(msg.sender);0-
    // }

    function createFund(string memory _name, uint256 _initialFunds) public {
        mapOfFunds[_name] = Fund(_initialFunds, msg.sender);
    }

    function addToFund(string memory _name, uint256 _addedFunds) public {
        // check if the fund exists
        // should there be a fee added that only goes to the contract
        mapOfFunds[_name].value = mapOfFunds[_name].value += _addedFunds;
    }

    function withdrawFromFund(string memory _name, uint256 _addedFunds) public {
        // check if the fund exists
        // check if the sender matches the owner of the fund
        // pay the sender from the contract the amount mapOfFunds[_name] has
    }
}
