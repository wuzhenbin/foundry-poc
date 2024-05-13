// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface WooPPV2 {
    struct DecimalInfo {
        uint64 priceDec;
        uint64 quoteDec;
        uint64 baseDec;
    }
}

interface IWooPPV2 {
    event AdminUpdated(address indexed addr, bool flag);
    event Deposit(
        address indexed token,
        address indexed sender,
        uint256 amount
    );
    event FeeAddrUpdated(address indexed newFeeAddr);
    event Migrate(
        address indexed token,
        address indexed receiver,
        uint256 amount
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Paused(address account);
    event Unpaused(address account);
    event Withdraw(
        address indexed token,
        address indexed receiver,
        uint256 amount
    );
    event WooSwap(
        address indexed fromToken,
        address indexed toToken,
        uint256 fromAmount,
        uint256 toAmount,
        address from,
        address indexed to,
        address rebateTo,
        uint256 swapVol,
        uint256 swapFee
    );
    event WooracleUpdated(address indexed newWooracle);

    function balance(address token) external view returns (uint256);

    function claimFee() external;

    function decimalInfo(
        address baseToken
    ) external view returns (WooPPV2.DecimalInfo memory);

    function deposit(address token, uint256 amount) external;

    function depositAll(address token) external;

    function feeAddr() external view returns (address);

    function inCaseTokenGotStuck(address stuckToken) external;

    function init(address _wooracle, address _feeAddr) external;

    function isAdmin(address) external view returns (bool);

    function lendManagers(address) external view returns (address);

    function migrateToNewPool(address token, address newPool) external;

    function owner() external view returns (address);

    function pause() external;

    function paused() external view returns (bool);

    function poolSize(address token) external view returns (uint256);

    function query(
        address fromToken,
        address toToken,
        uint256 fromAmount
    ) external view returns (uint256 toAmount);

    function quoteToken() external view returns (address);

    function renounceOwnership() external;

    function repayWeeklyLending(address wantToken) external;

    function setAdmin(address addr, bool flag) external;

    function setFeeAddr(address _feeAddr) external;

    function setFeeRate(address token, uint16 rate) external;

    function setLendManager(address _lendManager) external;

    function setWooracle(address _wooracle) external;

    function skim(address token) external;

    function skimMulTokens(address[] memory tokens) external;

    function swap(
        address fromToken,
        address toToken,
        uint256 fromAmount,
        uint256 minToAmount,
        address to,
        address rebateTo
    ) external returns (uint256 realToAmount);

    function sync(address token) external;

    function tokenInfos(
        address
    ) external view returns (uint192 reserve, uint16 feeRate);

    function transferOwnership(address newOwner) external;

    function tryQuery(
        address fromToken,
        address toToken,
        uint256 fromAmount
    ) external view returns (uint256 toAmount);

    function unclaimedFee() external view returns (uint256);

    function unpause() external;

    function withdraw(address token, uint256 amount) external;

    function withdrawAll(address token) external;

    function wooracle() external view returns (address);
}
