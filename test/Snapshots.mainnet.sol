// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@interface/IERC20.sol";

import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";
import "@interface/IUniswapV3.sol";

// token
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IERC20 constant WBTC = IERC20(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
IERC20 constant DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);

//  uniswap
IUniswapV2Factory constant UNISWAP_V2_FACTORY = IUniswapV2Factory(
    0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
);
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
);
bytes32 constant UniswapV3_POOL_INIT_CODE_HASH = 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54;
