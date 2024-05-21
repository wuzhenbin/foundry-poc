// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IWBNB.sol";

import "./IZongZi.sol";
import "./IZzf.sol";

IZongZi constant ZongZi = IZongZi(
    payable(0xBB652D0f1EbBc2C16632076B1592d45Db61a7a68)
);
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakePairV2 constant BNB_ZongZi_Pool = IPancakePairV2(
    0xD695C08a4c3B9FC646457aD6b0DC0A3b8f1219fe
);
IPancakePairV2 constant USDT_BNB_V2_Pool = IPancakePairV2(
    0x16b9a82891338f9bA80E2D6970FddA79D1eb0daE
);
IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IZzf constant Zzf = IZzf(payable(0xB7a254237E05cccA0a756f75FB78Ab2Df222911b));

contract ZongZiTest is Test {
    function setUp() public {
        vm.createSelectFork(
            "bsc",
            hex"247f4b3dbde9d8ab95c9766588d80f8dae835129225775ebd05a6dd2c69cd79f"
        );

        deal(address(WBNB), address(this), 1904.347826086956521739 ether);
        deal(address(this), 0);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        uint256 WBNBBalance = WBNB.balanceOf(address(this));
        uint256 BNBBalance = address(this).balance;
        print("WBNBBalance", WBNBBalance, 18);
        print("BNBBalance", BNBBalance, 18);
    }

    receive() external payable {}
}
