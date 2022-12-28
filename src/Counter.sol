// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint256 number;

    constructor() {
        number = 0;
    }

    function setNumber(uint256 newNumber) public {
        require(newNumber < 5, "Number must be less than 5");
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
