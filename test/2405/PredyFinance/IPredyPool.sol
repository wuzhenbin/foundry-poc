// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface PredyPool {
    function allowedTraders(
        address trader,
        uint256 pairId
    ) external view returns (bool);

    function allowedUniswapPools(address) external view returns (bool);

    function createVault(uint256 pairId) external returns (uint256);

    function execLiquidationCall(
        uint256 vaultId,
        uint256 closeRatio,
        bytes memory settlementData
    ) external returns (IPredyPool.TradeResult memory tradeResult);

    function getPairStatus(
        uint256 pairId
    ) external view returns (DataType.PairStatus memory);

    function getSqrtIndexPrice(uint256 pairId) external view returns (uint256);

    function getSqrtPrice(uint256 pairId) external view returns (uint160);

    function getVault(
        uint256 vaultId
    ) external view returns (DataType.Vault memory);

    function globalData()
        external
        view
        returns (
            uint256 pairsCount,
            uint256 vaultCount,
            address uniswapFactory,
            LockDataLibrary.LockData memory lockData
        );

    function initialize(address uniswapFactory) external;

    function operator() external view returns (address);

    function reallocate(
        uint256 pairId,
        bytes memory settlementData
    ) external returns (bool relocationOccurred);

    function registerPair(
        AddPairLogic.AddPairParams memory addPairParam
    ) external returns (uint256);

    function revertPairStatus(uint256 pairId) external;

    function revertVaultStatus(uint256 vaultId) external;

    function setOperator(address newOperator) external;

    function supply(
        uint256 pairId,
        bool isQuoteAsset,
        uint256 supplyAmount
    ) external returns (uint256 finalSuppliedAmount);

    function take(bool isQuoteAsset, address to, uint256 amount) external;

    function trade(
        IPredyPool.TradeParams memory tradeParams,
        bytes memory settlementData
    ) external returns (IPredyPool.TradeResult memory tradeResult);

    function uniswapV3MintCallback(
        uint256 amount0,
        uint256 amount1,
        bytes memory
    ) external;

    function updateAssetRiskParams(
        uint256 pairId,
        Perp.AssetRiskParams memory riskParams
    ) external;

    function updateFeeRatio(uint256 pairId, uint8 feeRatio) external;

    function updateIRMParams(
        uint256 pairId,
        InterestRateModel.IRMParams memory quoteIrmParams,
        InterestRateModel.IRMParams memory baseIrmParams
    ) external;

    function updatePoolOwner(uint256 pairId, address poolOwner) external;

    function updatePriceOracle(uint256 pairId, address priceOracle) external;

    function updateRecepient(uint256 vaultId, address recipient) external;

    function updateWhitelistAddress(
        uint256 pairId,
        address trader,
        bool enabled
    ) external;

    function withdraw(
        uint256 pairId,
        bool isQuoteAsset,
        uint256 withdrawAmount
    ) external returns (uint256 finalBurnAmount, uint256 finalWithdrawAmount);

    function withdrawCreatorRevenue(uint256 pairId, bool isQuoteToken) external;

    function withdrawProtocolRevenue(
        uint256 pairId,
        bool isQuoteToken
    ) external;
}

interface IPredyPool {
    struct Payoff {
        int256 perpEntryUpdate;
        int256 sqrtEntryUpdate;
        int256 sqrtRebalanceEntryUpdateUnderlying;
        int256 sqrtRebalanceEntryUpdateStable;
        int256 perpPayoff;
        int256 sqrtPayoff;
    }

    struct TradeResult {
        Payoff payoff;
        uint256 vaultId;
        int256 fee;
        int256 minMargin;
        int256 averagePrice;
        uint256 sqrtTwap;
        uint256 sqrtPrice;
    }

    struct TradeParams {
        uint256 pairId;
        uint256 vaultId;
        int256 tradeAmount;
        int256 tradeAmountSqrt;
        bytes extraData;
    }
}

interface ScaledAsset {
    struct AssetStatus {
        uint256 totalCompoundDeposited;
        uint256 totalNormalDeposited;
        uint256 totalNormalBorrowed;
        uint256 assetScaler;
        uint256 assetGrowth;
        uint256 debtGrowth;
    }

    struct UserStatus {
        int256 positionAmount;
        uint256 lastFeeGrowth;
    }
}

interface InterestRateModel {
    struct IRMParams {
        uint256 baseRate;
        uint256 kinkRate;
        uint256 slope1;
        uint256 slope2;
    }
}

interface Perp {
    struct AssetPoolStatus {
        address token;
        address supplyTokenAddress;
        ScaledAsset.AssetStatus tokenStatus;
        InterestRateModel.IRMParams irmParams;
        uint256 accumulatedProtocolRevenue;
        uint256 accumulatedCreatorRevenue;
    }

    struct AssetRiskParams {
        uint128 riskRatio;
        uint128 debtRiskRatio;
        int24 rangeSize;
        int24 rebalanceThreshold;
        uint64 minSlippage;
        uint64 maxSlippage;
    }

    struct SqrtPerpAssetStatus {
        address uniswapPool;
        int24 tickLower;
        int24 tickUpper;
        uint64 numRebalance;
        uint256 totalAmount;
        uint256 borrowedAmount;
        uint256 lastRebalanceTotalSquartAmount;
        uint256 lastFee0Growth;
        uint256 lastFee1Growth;
        uint256 borrowPremium0Growth;
        uint256 borrowPremium1Growth;
        uint256 fee0Growth;
        uint256 fee1Growth;
        ScaledAsset.UserStatus rebalancePositionBase;
        ScaledAsset.UserStatus rebalancePositionQuote;
        int256 rebalanceInterestGrowthBase;
        int256 rebalanceInterestGrowthQuote;
    }

    struct PositionStatus {
        int256 amount;
        int256 entryValue;
    }

    struct SqrtPositionStatus {
        int256 amount;
        int256 entryValue;
        int256 quoteRebalanceEntryValue;
        int256 baseRebalanceEntryValue;
        uint256 entryTradeFee0;
        uint256 entryTradeFee1;
    }

    struct UserStatus {
        uint256 pairId;
        int24 rebalanceLastTickLower;
        int24 rebalanceLastTickUpper;
        uint64 lastNumRebalance;
        PositionStatus perp;
        SqrtPositionStatus sqrtPerp;
        ScaledAsset.UserStatus basePosition;
        ScaledAsset.UserStatus stablePosition;
    }
}

interface DataType {
    struct PairStatus {
        uint256 id;
        address marginId;
        address poolOwner;
        Perp.AssetPoolStatus quotePool;
        Perp.AssetPoolStatus basePool;
        Perp.AssetRiskParams riskParams;
        Perp.SqrtPerpAssetStatus sqrtAssetStatus;
        address priceFeed;
        bool isQuoteZero;
        bool whitelistEnabled;
        uint8 feeRatio;
        uint256 lastUpdateTimestamp;
    }

    struct Vault {
        uint256 id;
        address marginId;
        address owner;
        address recipient;
        int256 margin;
        Perp.UserStatus openPosition;
    }
}

interface LockDataLibrary {
    struct LockData {
        address locker;
        uint256 quoteReserve;
        uint256 baseReserve;
        uint256 pairId;
    }
}

interface AddPairLogic {
    struct AddPairParams {
        address marginId;
        address poolOwner;
        address uniswapPool;
        address priceFeed;
        bool whitelistEnabled;
        uint8 fee;
        Perp.AssetRiskParams assetRiskParams;
        InterestRateModel.IRMParams quoteIrmParams;
        InterestRateModel.IRMParams baseIrmParams;
    }
}
