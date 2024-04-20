// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface ISatx {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function MAXADD() external view returns (uint160);

    function _haveLpAmount(address) external view returns (uint256);

    function _isPairs(address) external view returns (bool);

    function _userTokenNum(address) external view returns (uint256);

    function addOtherPair(address pairaddress, bool value) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function excludeFromFees(address account, bool excluded) external;

    function getLdxTokenAmount(
        address user,
        uint256 amount
    ) external view returns (uint256, uint256, uint256);

    function getLpBalanceByUsdt(
        uint256 usdtAmount
    ) external view returns (uint256, uint256);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function ktNum() external view returns (uint160);

    function lastHour() external view returns (uint256);

    function name() external view returns (string memory);

    function oneBnb() external view returns (uint256);

    function oneShit() external view returns (uint256);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function rescueToken(
        address tokenAddress,
        uint256 tokens
    ) external returns (bool);

    function reward() external view returns (address);

    function setExcludedFromFeesVip(address pairaddress, bool value) external;

    function setStartTime(uint256 _startTime) external;

    function startTime() external view returns (uint256);

    function swapAndLiquifyEnabled() external view returns (bool);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function uniswapV2Pair() external view returns (address);

    function uniswapV2Router() external view returns (address);

    function userMax() external view returns (uint256);

    receive() external payable;
}
