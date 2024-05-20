// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

interface Bank {
    struct Ilk {
        uint256 tart;
        uint256 rack;
        uint256 line;
        uint256 dust;
        uint256 fee;
        uint256 rho;
        uint256 chop;
        address hook;
    }
}

interface IBankDiamond {
    function FEE_MAX() external pure returns (uint256);

    function MINT() external pure returns (uint256);

    function bail(bytes32 i, address u) external payable returns (bytes memory);

    function ceil() external view returns (uint256);

    function debt() external view returns (uint256);

    function drip(bytes32 i) external payable;

    function filh(
        bytes32 ilk,
        bytes32 key,
        bytes32[] memory xs,
        bytes32 val
    ) external payable;

    function filk(bytes32 ilk, bytes32 key, bytes32 val) external payable;

    function flash(
        address code,
        bytes memory data
    ) external payable returns (bytes memory result);

    function frob(
        bytes32 i,
        address u,
        bytes memory dink,
        int256 dart
    ) external payable;

    function geth(
        bytes32 ilk,
        bytes32 key,
        bytes32[] memory xs
    ) external view returns (bytes32);

    function hookcallext(
        bytes32 i,
        bytes memory indata
    ) external payable returns (bytes memory);

    function ilks(bytes32 i) external view returns (Bank.Ilk memory);

    function init(bytes32 ilk, address hook) external payable;

    function ink(bytes32 i, address u) external view returns (bytes memory);

    function joy() external view returns (uint256);

    function par() external view returns (uint256);

    function rest() external view returns (uint256);

    function safe(
        bytes32 i,
        address u
    ) external view returns (uint8, uint256, uint256);

    function sin() external view returns (uint256);

    function urns(bytes32 i, address u) external view returns (uint256);
}
