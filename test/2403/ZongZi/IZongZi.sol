// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IZongZi {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event AutoNukeLP();
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function EmergeLaunch(bool flag) external;

    function addRewardOpen() external view returns (bool);

    function airdropAddr() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function automatedMarketMakerPairs(address) external view returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function burnFee() external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function divAddr() external view returns (address);

    function divFee() external view returns (uint256);

    function excludedFromFees(address account, bool excluded) external;

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isExcludedFromFees(address account) external view returns (bool);

    function lastLpzongziTime() external view returns (uint256);

    function launch() external view returns (bool);

    function lpAddr() external view returns (address);

    function lpFee() external view returns (uint256);

    function lpzongziEnabled() external view returns (bool);

    function lpzongziFrequency() external view returns (uint256);

    function marketAddr() external view returns (address);

    function marketFee() external view returns (uint256);

    function minAccountBalance() external view returns (uint256);

    function minBalanceSwapToken() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function percentForLPzongzi() external view returns (uint256);

    function renounceOwnership() external;

    function setAddRewardOpen(bool value) external;

    function setAddrs(address _divAddr) external;

    function setAutoLPzongziSettings(
        uint256 _frequencyInSeconds,
        uint256 _percent,
        bool _Enabled
    ) external;

    function setAutomatedMarketMakerPair(address pair, bool value) external;

    function setLaunch(bool flag) external;

    function setMinAccountBalance(uint256 amount) external;

    function setminBalanceSwapToken(uint256 _minBalanceSwapToken) external;

    function setzongziHolder(address _addr) external;

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

    function uniswapPair() external view returns (address);

    function uniswapRouter() external view returns (address);

    function zongziHolder() external view returns (address);

    function zongziToholder(
        address to,
        uint256 amount,
        uint256 balance
    ) external;

    receive() external payable;
}
