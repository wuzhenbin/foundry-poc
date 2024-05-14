// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IChamber {
    event AccumulateInterestEvent(uint128 accruedAmount);
    event BorrowEvent(
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 part
    );
    event ChangeBlacklistedEvent(address indexed account, bool blacklisted);
    event DepositCollateralEvent(
        address indexed from,
        address indexed to,
        uint256 share
    );
    event FeeToEvent(address indexed newFeeTo);
    event InterestChangeEvent(uint64 oldInterestRate, uint64 newInterestRate);
    event LogChangeBorrowLimit(uint128 newLimit, uint128 perAddressPart);
    event LogLiquidation(
        address indexed from,
        address indexed user,
        address indexed to,
        uint256 collateralShare,
        uint256 borrowAmount,
        uint256 borrowPart
    );
    event OwnershipTransferStarted(
        address indexed previousOwner,
        address indexed newOwner
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Paused(address account);
    event PriceUpdateEvent(uint256 rate);
    event RepayEvent(
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 part
    );
    event Unpaused(address account);
    event WithdrawCollateralEvent(
        address indexed from,
        address indexed to,
        uint256 share
    );
    event WithdrawFeesEvent(address indexed feeTo, uint256 feesEarnedFraction);

    function BORROW_OPENING_FEE() external view returns (uint256);

    function COLLATERIZATION_RATE() external view returns (uint256);

    function LIQUIDATION_MULTIPLIER() external view returns (uint256);

    function acceptOwnership() external;

    function accruedInterest()
        external
        view
        returns (
            uint64 lastAccrued,
            uint128 feesEarned,
            uint64 INTEREST_PER_SECOND
        );

    function accumulate() external;

    function bentoBox() external view returns (address);

    function blacklisted(address) external view returns (bool);

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

    function changeInterestRate(uint16 newInterestRateBps) external;

    function collateral() external view returns (address);

    function depositCollateral(address to, bool skim, uint256 share) external;

    function exchangeRate() external view returns (uint256);

    function feeTo() external view returns (address);

    function init(bytes memory data) external payable;

    function isSolvent(address user) external view returns (bool);

    function liquidate(
        address[] memory users,
        uint256[] memory maxBorrowParts,
        address to,
        address swapper,
        bytes memory swapperData
    ) external;

    function masterContract() external view returns (address);

    function oracle() external view returns (address);

    function oracleData() external view returns (bytes memory);

    function owner() external view returns (address);

    function paused() external view returns (bool);

    function pendingOwner() external view returns (address);

    function performOperations(
        uint8[] memory actions,
        uint256[] memory values,
        bytes[] memory datas
    ) external payable returns (uint256 value1, uint256 value2);

    function reduceSupply(uint256 amount) external;

    function removeCollateral(address to, uint256 share) external;

    function renounceOwnership() external;

    function repay(
        address to,
        bool skim,
        uint256 part
    ) external returns (uint256 amount);

    function senUSD() external view returns (address);

    function setBlacklistedCaller(address callee, bool _blacklisted) external;

    function setFeeTo(address newFeeTo) external;

    function totalBorrow()
        external
        view
        returns (uint128 elastic, uint128 base);

    function totalCollateralShare() external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function updatePrice() external returns (bool updated, uint256 rate);

    function userBorrowPart(address) external view returns (uint256);

    function userCollateralShare(address) external view returns (uint256);

    function withdrawFees() external;
}
