// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testGetNumber() public {
        assertEq(counter.getNumber(), 0);
    }

    function testFailGetNumber() public {
        // counter is 0
        assertEq(counter.getNumber(), 4);
    }

    function testSetNumber() public {
        counter.setNumber(2);
        assertEq(counter.getNumber(), 2);
    }

    function testFailSetNumber() public {
        // trying to set a number greater than 5, this should fail => test passing
        counter.setNumber(8);
    }

    // GOOD PRACTICE: A good practice is to use something like testCannot in combination with the expectRevert cheatcode (cheatcodes are explained in greater detail in the following section) Now instead of using testFail, you know exactly what reverted:
    // further reading : https://book.getfoundry.sh/forge/writing-tests
    function testCannotSetNumberMoreThanFive() public {
        vm.expectRevert("Number must be less than 5");
        counter.setNumber(6);
    }

    // FUZZ TESTING
    // for this to work remove the require statement from the contract
    // comment out the testFailSetNumber function and testCannotSetNumberMoreThanFive function as they will fail when the require statement is removed
    // this is just an example about fuzz testing in foundry, you do not need fuzzing for this particular contract
    // function testFuzzSetNumber(uint256 number) public {
    //     counter.setNumber(number);
    //     assertEq(counter.getNumber(), number);
    // }
}
