// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";

import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";
import "@interface/IUniswapV3.sol";

// bsc
WBNB constant BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IERC20 constant BUSD = IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
IERC20 constant USDC = IERC20(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d);

// bsc pancakeswap
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakeFactoryV2 constant PancakeFactoryV2 = IPancakeFactoryV2(
    0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73
);
bytes32 constant PancakeV3_POOL_INIT_CODE_HASH = 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2;

// mainnet
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IERC20 constant WBTC = IERC20(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
IERC20 constant DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);

// mainnet uniswap
IUniswapV2Factory constant UNISWAP_V2_FACTORY = IUniswapV2Factory(
    0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
);
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
);
bytes32 constant UniswapV3_POOL_INIT_CODE_HASH = 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54;
