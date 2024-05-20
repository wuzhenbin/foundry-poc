// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IUniV3Wrapper {
    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function getAssets()
        external
        view
        returns (uint256 amount0, uint256 amount1);

    function deposit(
        uint256 startingAmount0,
        uint256 startingAmount1,
        uint256 minAmount0Added,
        uint256 minAmount1Added
    ) external returns (uint128 liquidityMinted, uint256 sharesMinted);

    function transfer(address to, uint256 value) external returns (bool);

    function withdraw(
        uint256 shares
    )
        external
        returns (uint128 liquidityRemoved, uint256 amount0, uint256 amount1);
}
