// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IUps {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function burn(uint256 value) external;

    function burnFrom(address account, uint256 value) external;

    function canBuy() external view returns (bool);

    function decimals() external view returns (uint8);

    function getPrice() external view returns (uint256 price);

    function name() external view returns (string memory);

    function nodeList(uint256) external view returns (address);

    function owner() external view returns (address);

    function pairAddress() external view returns (address);

    function renounceOwnership() external;

    function sellRate() external view returns (uint256);

    function setNodeList(address[] memory list) external;

    function setRate(uint256 _sellRate) external;

    function setWhiteMap(address[] memory users, bool value) external;

    function swapRouter() external view returns (address);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function usdtAddress() external view returns (address);

    function whiteMap(address) external view returns (bool);
}
