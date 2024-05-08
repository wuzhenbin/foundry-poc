// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@interface/IERC20.sol";

interface IArk is IERC20 {
    function autoBurnLiquidityPairTokens() external;
}
