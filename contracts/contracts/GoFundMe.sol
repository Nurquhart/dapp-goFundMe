// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "hardhat/console.sol";

struct Fund {
    uint256 value;
    address owner;
    bool isActive;
}

contract GoFundMe {
    // address payable public owner;
    mapping(string => Fund) public mapOfFunds;

    function createFund(string memory _name, uint256 _initialFunds) public {
        mapOfFunds[_name] = Fund(_initialFunds, msg.sender, true);
    }

    function addToFund(string memory _name, uint256 _addedFunds) public {
        // check if the fund exists
        require(
            mapOfFunds[_name].isActive,
            "The fund is not active or does not exist"
        );
        // should there be a fee added that only goes to the contract
        mapOfFunds[_name].value = mapOfFunds[_name].value += _addedFunds;
    }

    function withdrawFromFund(string memory _name) public {
        // check if the fund exists
        require(
            mapOfFunds[_name].isActive,
            "The fund is not active or does not exist"
        );
        // check if the sender matches the owner of the fund
        require(
            msg.sender == mapOfFunds[_name].owner,
            "You aren't the owner of the fund"
        );
        // pay the sender from the contract the amount mapOfFunds[_name] has
        payable(msg.sender).transfer(mapOfFunds[_name].value);
    }
}
