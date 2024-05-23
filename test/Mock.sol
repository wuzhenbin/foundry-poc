// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";

contract AbiDecode {
    function encode(
        address from,
        address to,
        uint256 value
    ) external pure returns (bytes memory) {
        return abi.encode(from, to, value);
    }

    function decode(
        bytes calldata data
    ) external pure returns (address from, address to, uint256 value) {
        (from, to, value) = abi.decode(data, (address, address, uint256));
    }
}

contract MockTest is Test {
    AbiDecode abiDecode;

    function setUp() public {
        // abiDecode = new AbiDecode();
    }

    function testDecode() public view {}
}
