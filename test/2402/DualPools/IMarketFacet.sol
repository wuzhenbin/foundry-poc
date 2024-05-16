// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IMarketFacet {
    function _supportMarket(address vToken) external returns (uint256);

    function accountAssets(address, uint256) external view returns (address);

    function actionPaused(
        address market,
        uint8 action
    ) external view returns (bool);

    function admin() external view returns (address);

    function allMarkets(uint256) external view returns (address);

    function approvedDelegates(address, address) external view returns (bool);

    function borrowCapGuardian() external view returns (address);

    function borrowCaps(address) external view returns (uint256);

    function checkMembership(
        address account,
        address vToken
    ) external view returns (bool);

    function closeFactorMantissa() external view returns (uint256);

    function comptrollerImplementation() external view returns (address);

    function comptrollerLens() external view returns (address);

    function enterMarkets(
        address[] calldata vTokens
    ) external returns (uint256[] memory);

    function exitMarket(address vTokenAddress) external returns (uint256);

    function getAllMarkets() external view returns (address[] memory);

    function getAssetsIn(
        address account
    ) external view returns (address[] memory);

    function getXVSAddress() external pure returns (address);

    function isComptroller() external pure returns (bool);

    function isForcedLiquidationEnabled(address) external view returns (bool);

    function liquidateCalculateSeizeTokens(
        address vTokenBorrowed,
        address vTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256);

    function liquidateVAICalculateSeizeTokens(
        address vTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256);

    function liquidationIncentiveMantissa() external view returns (uint256);

    function liquidatorContract() external view returns (address);

    function markets(
        address
    )
        external
        view
        returns (bool isListed, uint256 collateralFactorMantissa, bool isVenus);

    function maxAssets() external view returns (uint256);

    function minReleaseAmount() external view returns (uint256);

    function mintVAIGuardianPaused() external view returns (bool);

    function mintedVAIs(address) external view returns (uint256);

    function oracle() external view returns (address);

    function pauseGuardian() external view returns (address);

    function pendingAdmin() external view returns (address);

    function pendingComptrollerImplementation() external view returns (address);

    function protocolPaused() external view returns (bool);

    function releaseStartBlock() external view returns (uint256);

    function repayVAIGuardianPaused() external view returns (bool);

    function supplyCaps(address) external view returns (uint256);

    function treasuryAddress() external view returns (address);

    function treasuryGuardian() external view returns (address);

    function treasuryPercent() external view returns (uint256);

    function updateDelegate(address delegate, bool allowBorrows) external;

    function vaiController() external view returns (address);

    function vaiMintRate() external view returns (uint256);

    function vaiVaultAddress() external view returns (address);

    function venusAccrued(address) external view returns (uint256);

    function venusBorrowSpeeds(address) external view returns (uint256);

    function venusBorrowState(
        address
    ) external view returns (uint224 index, uint32 block);

    function venusBorrowerIndex(
        address,
        address
    ) external view returns (uint256);

    function venusInitialIndex() external view returns (uint224);

    function venusSupplierIndex(
        address,
        address
    ) external view returns (uint256);

    function venusSupplySpeeds(address) external view returns (uint256);

    function venusSupplyState(
        address
    ) external view returns (uint224 index, uint32 block);

    function venusVAIVaultRate() external view returns (uint256);
}
