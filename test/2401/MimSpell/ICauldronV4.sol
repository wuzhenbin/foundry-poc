// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ICauldronV4 {
    function BORROW_OPENING_FEE() external view returns (uint256);

    function COLLATERIZATION_RATE() external view returns (uint256);

    function LIQUIDATION_MULTIPLIER() external view returns (uint256);

    function accrue() external;

    function accrueInfo()
        external
        view
        returns (
            uint64 lastAccrued,
            uint128 feesEarned,
            uint64 INTEREST_PER_SECOND
        );

    function addCollateral(address to, bool skim, uint256 share) external;

    function bentoBox() external view returns (address);

    function blacklistedCallees(address) external view returns (bool);

    function borrow(
        address to,
        uint256 amount
    ) external returns (uint256 part, uint256 share);

    function borrowLimit()
        external
        view
        returns (uint128 total, uint128 borrowPartPerAddress);

    function changeBorrowLimit(
        uint128 newBorrowLimit,
        uint128 perAddressPart
    ) external;

    function changeInterestRate(uint64 newInterestRate) external;

    function claimOwnership() external;

    function collateral() external view returns (address);

    function cook(
        uint8[] memory actions,
        uint256[] memory values,
        bytes[] memory datas
    ) external payable returns (uint256 value1, uint256 value2);

    function exchangeRate() external view returns (uint256);

    function feeTo() external view returns (address);

    function init(bytes memory data) external payable;

    function liquidate(
        address[] memory users,
        uint256[] memory maxBorrowParts,
        address to,
        address swapper,
        bytes memory swapperData
    ) external;

    function magicInternetMoney() external view returns (address);

    function masterContract() external view returns (address);

    function oracle() external view returns (address);

    function oracleData() external view returns (bytes memory);

    function owner() external view returns (address);

    function pendingOwner() external view returns (address);

    function reduceSupply(uint256 amount) external;

    function removeCollateral(address to, uint256 share) external;

    function repay(
        address to,
        bool skim,
        uint256 part
    ) external returns (uint256 amount);

    function repayForAll(uint128 amount, bool skim) external returns (uint128);

    function setBlacklistedCallee(address callee, bool blacklisted) external;

    function setFeeTo(address newFeeTo) external;

    function totalBorrow()
        external
        view
        returns (uint128 elastic, uint128 base);

    function totalCollateralShare() external view returns (uint256);

    function transferOwnership(
        address newOwner,
        bool direct,
        bool renounce
    ) external;

    function updateExchangeRate() external returns (bool updated, uint256 rate);

    function userBorrowPart(address) external view returns (uint256);

    function userCollateralShare(address) external view returns (uint256);

    function withdrawFees() external;
}
