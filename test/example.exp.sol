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

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        SomeHack hacker = new SomeHack();
        hacker.fuckyou();
    }
}

contract some2Test is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 13_076_768);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {}
}
