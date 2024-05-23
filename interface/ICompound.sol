// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ICErc20 {
    function name() external view returns (string memory);

    function approve(address spender, uint256 amount) external returns (bool);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function totalSupply() external view returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function repayBorrowBehalf(
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function pendingAdmin() external view returns (address);

    function decimals() external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function getCash() external view returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function totalBorrows() external view returns (uint256);

    function comptroller() external view returns (address);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function initialExchangeRateMantissa() external view returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function underlying() external view returns (address);

    function balanceOf(address owner) external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function totalReserves() external view returns (uint256);

    function symbol() external view returns (string memory);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function mint(uint256 mintAmount) external returns (uint256);

    function accrueInterest() external returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function borrowIndex() external view returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function _setPendingAdmin(
        address newPendingAdmin
    ) external returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256, uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function _acceptAdmin() external returns (uint256);

    function _setInterestRateModel(
        address newInterestRateModel
    ) external returns (uint256);

    function interestRateModel() external view returns (address);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral
    ) external returns (uint256);

    function admin() external view returns (address);

    function borrowRatePerBlock() external view returns (uint256);

    function _setReserveFactor(
        uint256 newReserveFactorMantissa
    ) external returns (uint256);

    function isCToken() external view returns (bool);

    event AccrueInterest(
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
}

interface ICEther {
    function name() external view returns (string memory);

    function approve(address spender, uint256 amount) external returns (bool);

    function mint() external payable;

    function reserveFactorMantissa() external view returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function totalSupply() external view returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function pendingAdmin() external view returns (address);

    function decimals() external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function getCash() external view returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function totalBorrows() external view returns (uint256);

    function repayBorrow() external payable;

    function comptroller() external view returns (address);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function initialExchangeRateMantissa() external view returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function totalReserves() external view returns (uint256);

    function symbol() external view returns (string memory);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function borrowIndex() external view returns (uint256);

    function liquidateBorrow(
        address borrower,
        address cTokenCollateral
    ) external payable;

    function supplyRatePerBlock() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function _setPendingAdmin(
        address newPendingAdmin
    ) external returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256, uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function repayBorrowBehalf(address borrower) external payable;

    function _acceptAdmin() external returns (uint256);

    function _setInterestRateModel(
        address newInterestRateModel
    ) external returns (uint256);

    function interestRateModel() external view returns (address);

    function admin() external view returns (address);

    function borrowRatePerBlock() external view returns (uint256);

    function _setReserveFactor(
        uint256 newReserveFactorMantissa
    ) external returns (uint256);

    function isCToken() external view returns (bool);

    receive() external payable;
}

interface IComptroller {
    function _become(address unitroller) external;

    function _borrowGuardianPaused() external view returns (bool);

    function _grantComp(address recipient, uint256 amount) external;

    function _mintGuardianPaused() external view returns (bool);

    function _setBorrowCapGuardian(address newBorrowCapGuardian) external;

    function _setBorrowPaused(
        address cToken,
        bool state
    ) external returns (bool);

    function _setCloseFactor(
        uint256 newCloseFactorMantissa
    ) external returns (uint256);

    function _setCollateralFactor(
        address cToken,
        uint256 newCollateralFactorMantissa
    ) external returns (uint256);

    function _setCompSpeeds(
        address[] memory cTokens,
        uint256[] memory supplySpeeds,
        uint256[] memory borrowSpeeds
    ) external;

    function _setContributorCompSpeed(
        address contributor,
        uint256 compSpeed
    ) external;

    function _setLiquidationIncentive(
        uint256 newLiquidationIncentiveMantissa
    ) external returns (uint256);

    function _setMarketBorrowCaps(
        address[] memory cTokens,
        uint256[] memory newBorrowCaps
    ) external;

    function _setMintPaused(address cToken, bool state) external returns (bool);

    function _setPauseGuardian(
        address newPauseGuardian
    ) external returns (uint256);

    function _setPriceOracle(address newOracle) external returns (uint256);

    function _setSeizePaused(bool state) external returns (bool);

    function _setTransferPaused(bool state) external returns (bool);

    function _supportMarket(address cToken) external returns (uint256);

    function accountAssets(address, uint256) external view returns (address);

    function admin() external view returns (address);

    function allMarkets(uint256) external view returns (address);

    function borrowAllowed(
        address cToken,
        address borrower,
        uint256 borrowAmount
    ) external returns (uint256);

    function borrowCapGuardian() external view returns (address);

    function borrowCaps(address) external view returns (uint256);

    function borrowGuardianPaused(address) external view returns (bool);

    function borrowVerify(
        address cToken,
        address borrower,
        uint256 borrowAmount
    ) external;

    function checkMembership(
        address account,
        address cToken
    ) external view returns (bool);

    function claimComp(address holder, address[] memory cTokens) external;

    function claimComp(
        address[] memory holders,
        address[] memory cTokens,
        bool borrowers,
        bool suppliers
    ) external;

    function claimComp(address holder) external;

    function closeFactorMantissa() external view returns (uint256);

    function compAccrued(address) external view returns (uint256);

    function compBorrowSpeeds(address) external view returns (uint256);

    function compBorrowState(
        address
    ) external view returns (uint224 index, uint32 block);

    function compBorrowerIndex(
        address,
        address
    ) external view returns (uint256);

    function compContributorSpeeds(address) external view returns (uint256);

    function compInitialIndex() external view returns (uint224);

    function compRate() external view returns (uint256);

    function compReceivable(address) external view returns (uint256);

    function compSpeeds(address) external view returns (uint256);

    function compSupplierIndex(
        address,
        address
    ) external view returns (uint256);

    function compSupplySpeeds(address) external view returns (uint256);

    function compSupplyState(
        address
    ) external view returns (uint224 index, uint32 block);

    function comptrollerImplementation() external view returns (address);

    function enterMarkets(
        address[] memory cTokens
    ) external returns (uint256[] memory);

    function exitMarket(address cTokenAddress) external returns (uint256);

    function fixBadAccruals(
        address[] memory affectedUsers,
        uint256[] memory amounts
    ) external;

    function getAccountLiquidity(
        address account
    ) external view returns (uint256, uint256, uint256);

    function getAllMarkets() external view returns (address[] memory);

    function getAssetsIn(
        address account
    ) external view returns (address[] memory);

    function getBlockNumber() external view returns (uint256);

    function getCompAddress() external view returns (address);

    function getHypotheticalAccountLiquidity(
        address account,
        address cTokenModify,
        uint256 redeemTokens,
        uint256 borrowAmount
    ) external view returns (uint256, uint256, uint256);

    function isComptroller() external view returns (bool);

    function isDeprecated(address cToken) external view returns (bool);

    function lastContributorBlock(address) external view returns (uint256);

    function liquidateBorrowAllowed(
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function liquidateBorrowVerify(
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint256 actualRepayAmount,
        uint256 seizeTokens
    ) external;

    function liquidateCalculateSeizeTokens(
        address cTokenBorrowed,
        address cTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256);

    function liquidationIncentiveMantissa() external view returns (uint256);

    function markets(
        address
    )
        external
        view
        returns (
            bool isListed,
            uint256 collateralFactorMantissa,
            bool isComped
        );

    function maxAssets() external view returns (uint256);

    function mintAllowed(
        address cToken,
        address minter,
        uint256 mintAmount
    ) external returns (uint256);

    function mintGuardianPaused(address) external view returns (bool);

    function mintVerify(
        address cToken,
        address minter,
        uint256 actualMintAmount,
        uint256 mintTokens
    ) external;

    function oracle() external view returns (address);

    function pauseGuardian() external view returns (address);

    function pendingAdmin() external view returns (address);

    function pendingComptrollerImplementation() external view returns (address);

    function proposal65FixExecuted() external view returns (bool);

    function redeemAllowed(
        address cToken,
        address redeemer,
        uint256 redeemTokens
    ) external returns (uint256);

    function redeemVerify(
        address cToken,
        address redeemer,
        uint256 redeemAmount,
        uint256 redeemTokens
    ) external;

    function repayBorrowAllowed(
        address cToken,
        address payer,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function repayBorrowVerify(
        address cToken,
        address payer,
        address borrower,
        uint256 actualRepayAmount,
        uint256 borrowerIndex
    ) external;

    function seizeAllowed(
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function seizeGuardianPaused() external view returns (bool);

    function seizeVerify(
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external;

    function transferAllowed(
        address cToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external returns (uint256);

    function transferGuardianPaused() external view returns (bool);

    function transferVerify(
        address cToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external;

    function updateContributorRewards(address contributor) external;
}

interface ICErc20Delegator {
    function _acceptAdmin() external returns (uint256);

    function _addReserves(uint256 addAmount) external returns (uint256);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setImplementation(
        address implementation_,
        bool allowResign,
        bytes memory becomeImplementationData
    ) external;

    function _setInterestRateModel(
        address newInterestRateModel
    ) external returns (uint256);

    function _setPendingAdmin(
        address newPendingAdmin
    ) external returns (uint256);

    function _setReserveFactor(
        uint256 newReserveFactorMantissa
    ) external returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function delegateToImplementation(
        bytes memory data
    ) external returns (bytes memory);

    function delegateToViewImplementation(
        bytes memory data
    ) external view returns (bytes memory);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256, uint256);

    function getCash() external view returns (uint256);

    function implementation() external view returns (address);

    function interestRateModel() external view returns (address);

    function isCToken() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral
    ) external returns (uint256);

    function mint(uint256 mintAmount) external returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function repayBorrowBehalf(
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

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

interface UniswapConfig {
    struct TokenConfig {
        address cToken;
        address underlying;
        bytes32 symbolHash;
        uint256 baseUnit;
        uint8 priceSource;
        uint256 fixedPrice;
        address uniswapMarket;
        address reporter;
        uint256 reporterMultiplier;
        bool isUniswapReversed;
    }
}

interface IUniswapAnchoredView {
    event FailoverActivated(bytes32 indexed symbolHash);
    event FailoverDeactivated(bytes32 indexed symbolHash);
    event OwnershipTransferRequested(address indexed from, address indexed to);
    event OwnershipTransferred(address indexed from, address indexed to);
    event PriceGuarded(
        bytes32 indexed symbolHash,
        uint256 reporterPrice,
        uint256 anchorPrice
    );
    event PriceUpdated(bytes32 indexed symbolHash, uint256 price);

    function ETH_BASE_UNIT() external view returns (uint256);

    function EXP_SCALE() external view returns (uint256);

    function MAX_INTEGER() external view returns (uint256);

    function MAX_TOKENS() external view returns (uint256);

    function acceptOwnership() external;

    function activateFailover(bytes32 symbolHash) external;

    function anchorPeriod() external view returns (uint32);

    function deactivateFailover(bytes32 symbolHash) external;

    function getTokenConfig(
        uint256 i
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getTokenConfigByCToken(
        address cToken
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getTokenConfigByReporter(
        address reporter
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getTokenConfigBySymbol(
        string memory symbol
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getTokenConfigBySymbolHash(
        bytes32 symbolHash
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getTokenConfigByUnderlying(
        address underlying
    ) external view returns (UniswapConfig.TokenConfig memory);

    function getUnderlyingPrice(address cToken) external view returns (uint256);

    function lowerBoundAnchorRatio() external view returns (uint256);

    function numTokens() external view returns (uint256);

    function owner() external view returns (address);

    function pokeFailedOverPrice(bytes32 symbolHash) external;

    function price(string memory symbol) external view returns (uint256);

    function prices(
        bytes32
    ) external view returns (uint248 price, bool failoverActive);

    function transferOwnership(address to) external;

    function upperBoundAnchorRatio() external view returns (uint256);

    function validate(
        uint256,
        int256,
        uint256,
        int256 currentAnswer
    ) external returns (bool valid);
}
