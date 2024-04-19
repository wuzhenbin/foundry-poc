// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IWBNB.sol";
import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IERC20.sol";

contract MarksTest is Test {
    WBNB BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
    IERC20 FLUF = IERC20(0x8d1139A72A1B8E8B6AA4436E62c3Dd891631a856);
    IERC20 BUSDT = IERC20(0x55d398326f99059fF775485246999027B3197955);

    IPancakeRouterV2 pancakeRouterV2 =
        IPancakeRouterV2(payable(0x10ED43C718714eb63d5aA57B78B54704E256024E));

    function setUp() public {
        vm.createSelectFork("bsc");
        deal(address(BNB), address(this), 10 ether);
    }

    function testExploit() public {}

    receive() external payable {}
}
