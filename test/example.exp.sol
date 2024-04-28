// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

contract SomeHack {
    function fuckyou() public {}
}

contract someTest is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 13_076_768);
    }

    function testExploit() public {
        SomeHack hacker = new SomeHack();
        hacker.fuckyou();
    }
}
