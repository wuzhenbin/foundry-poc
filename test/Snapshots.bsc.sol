// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";

import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";
import "@interface/IUniswapV3.sol";

// token
WBNB constant BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IERC20 constant BUSD = IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
IERC20 constant USDC = IERC20(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d);

//  pancakeswap
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakeFactoryV2 constant PancakeFactoryV2 = IPancakeFactoryV2(
    0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73
);
address constant PANCAKE_V3_FACTORY = 0x0BFbCF9fa4f9C56B0F40a671Ad40E0805A091865;
bytes32 constant PancakeV3_POOL_INIT_CODE_HASH = 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2;
