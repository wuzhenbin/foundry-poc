// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IParaSwapAugustusV6 {
    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes memory data
    ) external;
}
