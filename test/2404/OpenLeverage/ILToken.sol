// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ILToken {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        address payee,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewBorrowCapFactorMantissa(
        uint256 oldBorrowCapFactorMantissa,
        uint256 newBorrowCapFactorMantissa
    );
    event NewController(address oldController, address newController);
    event NewInterestParam(
        uint256 baseRatePerBlock,
        uint256 multiplierPerBlock,
        uint256 jumpMultiplierPerBlock,
        uint256 kink
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 badDebtsAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address to,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function acceptAdmin() external;

    function accrualBlockNumber() external view returns (uint256);

    function accrualBlockTimestamp() external view returns (uint256);

    function accrueInterest() external;

    function addReserves(uint256 addAmount) external payable;

    function admin() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function availableForBorrow() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function baseRatePerBlock() external view returns (uint256);

    function borrowBalanceCurrent(
        address account
    ) external view returns (uint256);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function borrowBehalf(address borrower, uint256 borrowAmount) external;

    function borrowCapFactorMantissa() external view returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function controller() external view returns (address);

    function decimals() external view returns (uint8);

    function developer() external view returns (address);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256);

    function getCash() external view returns (uint256);

    function implementation() external view returns (address);

    function initialize(
        address underlying_,
        bool isWethPool_,
        address controller_,
        uint256 baseRatePerBlock_,
        uint256 multiplierPerBlock_,
        uint256 jumpMultiplierPerBlock_,
        uint256 kink_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function isWethPool() external view returns (bool);

    function jumpMultiplierPerBlock() external view returns (uint256);

    function kink() external view returns (uint256);

    function mint(uint256 mintAmount) external;

    function mintEth() external payable;

    function mintTo(address to, uint256 amount) external payable;

    function multiplierPerBlock() external view returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function redeem(uint256 redeemTokens) external;

    function redeemUnderlying(uint256 redeemAmount) external;

    function reduceReserves(address to, uint256 reduceAmount) external;

    function repayBorrowBehalf(address borrower, uint256 repayAmount) external;

    function repayBorrowEndByOpenLev(
        address borrower,
        uint256 repayAmount
    ) external;

    function reserveFactorMantissa() external view returns (uint256);

    function setBorrowCapFactorMantissa(
        uint256 newBorrowCapFactorMantissa
    ) external;

    function setController(address newController) external;

    function setInterestParams(
        uint256 baseRatePerBlock_,
        uint256 multiplierPerBlock_,
        uint256 jumpMultiplierPerBlock_,
        uint256 kink_
    ) external;

    function setPendingAdmin(address newPendingAdmin) external;

    function setReserveFactor(uint256 newReserveFactorMantissa) external;

    function supplyRatePerBlock() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external view returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);
}
