// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IComptroller {
    function _become(address unitroller) external;

    function _borrowGuardianPaused() external view returns (bool);

    function _delistMarket(address bToken, bool force) external;

    function _mintGuardianPaused() external view returns (bool);

    function _pauseCreditLimit(address protocol, address market) external;

    function _setBorrowPaused(
        address bToken,
        bool state
    ) external returns (bool);

    function _setCloseFactor(
        uint256 newCloseFactorMantissa
    ) external returns (uint256);

    function _setCollateralFactor(
        address bToken,
        uint256 newCollateralFactorMantissa
    ) external returns (uint256);

    function _setCreditLimit(
        address protocol,
        address market,
        uint256 creditLimit
    ) external;

    function _setCreditLimitManager(address newCreditLimitManager) external;

    function _setFlashloanPaused(
        address bToken,
        bool state
    ) external returns (bool);

    function _setGuardian(address newGuardian) external returns (uint256);

    function _setLiquidationIncentive(
        uint256 newLiquidationIncentiveMantissa
    ) external returns (uint256);

    function _setLiquidityMining(address newLiquidityMining) external;

    function _setMarketBorrowCaps(
        address[] memory bTokens,
        uint256[] memory newBorrowCaps
    ) external;

    function _setMarketSupplyCaps(
        address[] memory bTokens,
        uint256[] memory newSupplyCaps
    ) external;

    function _setMintPaused(address bToken, bool state) external returns (bool);

    function _setPriceOracle(address newOracle) external returns (uint256);

    function _setSeizePaused(bool state) external returns (bool);

    function _setTransferPaused(bool state) external returns (bool);

    function _supportMarket(
        address bToken,
        uint8 version
    ) external returns (uint256);

    function accountAssets(address, uint256) external view returns (address);

    function admin() external view returns (address);

    function allMarkets(uint256) external view returns (address);

    function borrowAllowed(
        address bToken,
        address borrower,
        uint256 borrowAmount
    ) external returns (uint256);

    function borrowCapGuardian() external view returns (address);

    function borrowCaps(address) external view returns (uint256);

    function borrowGuardianPaused(address) external view returns (bool);

    function borrowVerify(
        address bToken,
        address borrower,
        uint256 borrowAmount
    ) external;

    function checkMembership(
        address account,
        address bToken
    ) external view returns (bool);

    function closeFactorMantissa() external view returns (uint256);

    function compAccrued(address) external view returns (uint256);

    function compBorrowState(
        address
    ) external view returns (uint224 index, uint32 block);

    function compBorrowerIndex(
        address,
        address
    ) external view returns (uint256);

    function compSpeeds(address) external view returns (uint256);

    function compSupplierIndex(
        address,
        address
    ) external view returns (uint256);

    function compSupplyState(
        address
    ) external view returns (uint224 index, uint32 block);

    function comptrollerImplementation() external view returns (address);

    function creditLimitManager() external view returns (address);

    function creditLimits(
        address protocol,
        address market
    ) external view returns (uint256);

    function creditLimits(address protocol) external view returns (uint256);

    function enterMarkets(
        address[] memory bTokens
    ) external returns (uint256[] memory);

    function exitMarket(address bTokenAddress) external returns (uint256);

    function flashloanAllowed(
        address bToken,
        address receiver,
        uint256 amount,
        bytes memory params
    ) external view returns (bool);

    function flashloanGuardianPaused(address) external view returns (bool);

    function getAccountLiquidity(
        address account
    ) external view returns (uint256, uint256, uint256);

    function getAllMarkets() external view returns (address[] memory);

    function getAssetsIn(
        address account
    ) external view returns (address[] memory);

    function getBlockTimestamp() external view returns (uint256);

    function getHypotheticalAccountLiquidity(
        address account,
        address bTokenModify,
        uint256 redeemTokens,
        uint256 borrowAmount
    ) external view returns (uint256, uint256, uint256);

    function guardian() external view returns (address);

    function isComptroller() external view returns (bool);

    function isCreditAccount(
        address account,
        address bToken
    ) external view returns (bool);

    function isMarketDelisted(address) external view returns (bool);

    function isMarketListed(address bTokenAddress) external view returns (bool);

    function isMarketListedOrDelisted(
        address bTokenAddress
    ) external view returns (bool);

    function liquidateBorrowAllowed(
        address bTokenBorrowed,
        address bTokenCollateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function liquidateBorrowVerify(
        address bTokenBorrowed,
        address bTokenCollateral,
        address liquidator,
        address borrower,
        uint256 actualRepayAmount,
        uint256 seizeTokens
    ) external;

    function liquidateCalculateSeizeTokens(
        address bTokenBorrowed,
        address bTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256);

    function liquidationIncentiveMantissa() external view returns (uint256);

    function liquidityMining() external view returns (address);

    function markets(
        address
    )
        external
        view
        returns (
            bool isListed,
            uint256 collateralFactorMantissa,
            uint8 version
        );

    function mintAllowed(
        address bToken,
        address minter,
        uint256 mintAmount
    ) external returns (uint256);

    function mintGuardianPaused(address) external view returns (bool);

    function mintVerify(
        address bToken,
        address minter,
        uint256 actualMintAmount,
        uint256 mintTokens
    ) external;

    function oracle() external view returns (address);

    function pendingAdmin() external view returns (address);

    function pendingComptrollerImplementation() external view returns (address);

    function redeemAllowed(
        address bToken,
        address redeemer,
        uint256 redeemTokens
    ) external returns (uint256);

    function redeemVerify(
        address bToken,
        address redeemer,
        uint256 redeemAmount,
        uint256 redeemTokens
    ) external;

    function repayBorrowAllowed(
        address bToken,
        address payer,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function repayBorrowVerify(
        address bToken,
        address payer,
        address borrower,
        uint256 actualRepayAmount,
        uint256 borrowerIndex
    ) external;

    function seizeAllowed(
        address bTokenCollateral,
        address bTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function seizeGuardianPaused() external view returns (bool);

    function seizeVerify(
        address bTokenCollateral,
        address bTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external;

    function supplyCapGuardian() external view returns (address);

    function supplyCaps(address) external view returns (uint256);

    function transferAllowed(
        address bToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external returns (uint256);

    function transferGuardianPaused() external view returns (bool);

    function transferVerify(
        address bToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external;

    function updateBTokenVersion(address bToken, uint8 newVersion) external;
}
