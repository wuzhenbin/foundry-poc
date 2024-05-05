// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IOPBorrowingDelegator {
    event Borrow(
        address indexed borrower,
        uint16 marketId,
        bool collateralIndex,
        uint256 collateral,
        uint256 borrow,
        uint256 borrowFees
    );
    event Liquidate(
        address indexed borrower,
        uint16 marketId,
        bool collateralIndex,
        address liquidator,
        uint256 collateralDecrease,
        uint256 repayAmount,
        uint256 outstandingAmount,
        uint256 liquidateFees,
        uint256 token0Price
    );
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewLiquidity(
        uint16 marketId,
        uint256 oldToken0Liq,
        uint256 oldToken1Liq,
        uint256 newToken0Liq,
        uint256 newToken1Liq
    );
    event NewMarket(
        uint16 marketId,
        address pool0,
        address pool1,
        address token0,
        address token1,
        uint32 dex,
        uint256 token0Liq,
        uint256 token1Liq
    );
    event NewMarketConf(
        uint16 marketId,
        uint16 collateralRatio,
        uint16 maxLiquidityRatio,
        uint16 borrowFeesRatio,
        uint16 insuranceRatio,
        uint16 poolReturnsRatio,
        uint16 liquidateFeesRatio,
        uint16 liquidatorReturnsRatio,
        uint16 liquidateInsuranceRatio,
        uint16 liquidatePoolReturnsRatio,
        uint16 liquidateMaxLiquidityRatio,
        uint16 twapDuration
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event Redeem(
        address indexed borrower,
        uint16 marketId,
        bool collateralIndex,
        uint256 collateral
    );
    event Repay(
        address indexed borrower,
        uint16 marketId,
        bool collateralIndex,
        uint256 repayAmount,
        uint256 collateral
    );

    function acceptAdmin() external;

    function activeCollaterals(
        address,
        uint16,
        bool
    ) external view returns (uint256);

    function addMarket(
        uint16 marketId,
        address pool0,
        address pool1,
        bytes memory dexData
    ) external;

    function admin() external view returns (address);

    function borrow(
        uint16 marketId,
        bool collateralIndex,
        uint256 collateral,
        uint256 borrowing
    ) external payable;

    function collateralRatio(
        uint16 marketId,
        bool collateralIndex,
        address borrower
    ) external view returns (uint256);

    function controller() external view returns (address);

    function developer() external view returns (address);

    function dexAgg() external view returns (address);

    function implementation() external view returns (address);

    function initialize(
        OPBorrowingStorage.MarketConf memory _marketDefConf,
        OPBorrowingStorage.LiquidationConf memory _liquidationConf
    ) external;

    function insurances(
        uint16
    ) external view returns (uint256 insurance0, uint256 insurance1);

    function liquidate(
        uint16 marketId,
        bool collateralIndex,
        address borrower
    ) external;

    function liquidationConf()
        external
        view
        returns (
            uint128 liquidatorXOLEHeld,
            uint8 priceDiffRatio,
            address buyBack
        );

    function marketDefConf()
        external
        view
        returns (
            uint16 collateralRatio,
            uint16 maxLiquidityRatio,
            uint16 borrowFeesRatio,
            uint16 insuranceRatio,
            uint16 poolReturnsRatio,
            uint16 liquidateFeesRatio,
            uint16 liquidatorReturnsRatio,
            uint16 liquidateInsuranceRatio,
            uint16 liquidatePoolReturnsRatio,
            uint16 liquidateMaxLiquidityRatio,
            uint16 twapDuration
        );

    function markets(
        uint16
    )
        external
        view
        returns (
            address pool0,
            address pool1,
            address token0,
            address token1,
            uint32 dex
        );

    function marketsConf(
        uint16
    )
        external
        view
        returns (
            uint16 collateralRatio,
            uint16 maxLiquidityRatio,
            uint16 borrowFeesRatio,
            uint16 insuranceRatio,
            uint16 poolReturnsRatio,
            uint16 liquidateFeesRatio,
            uint16 liquidatorReturnsRatio,
            uint16 liquidateInsuranceRatio,
            uint16 liquidatePoolReturnsRatio,
            uint16 liquidateMaxLiquidityRatio,
            uint16 twapDuration
        );

    function migrateOpenLevMarkets(uint16 from, uint16 to) external;

    function moveInsurance(
        uint16 marketId,
        bool tokenIndex,
        address to,
        uint256 moveShare
    ) external;

    function openLev() external view returns (address);

    function pendingAdmin() external view returns (address);

    function redeem(
        uint16 marketId,
        bool collateralIndex,
        uint256 collateral
    ) external;

    function repay(
        uint16 marketId,
        bool collateralIndex,
        uint256 repayAmount,
        bool isRedeem
    ) external payable returns (uint256 redeemShare);

    function setMarketConf(
        uint16 marketId,
        OPBorrowingStorage.MarketConf memory _marketConf
    ) external;

    function setMarketDex(uint16 marketId, uint32 dex) external;

    function setPendingAdmin(address newPendingAdmin) external;

    function setTwaLiquidity(
        uint16[] memory marketIds,
        OPBorrowingStorage.Liquidity[] memory liquidity
    ) external;

    function totalShares(address) external view returns (uint256);

    function twaLiquidity(
        uint16
    ) external view returns (uint256 token0Liq, uint256 token1Liq);

    function wETH() external view returns (address);

    function xOLE() external view returns (address);
}

interface OPBorrowingStorage {
    struct MarketConf {
        uint16 collateralRatio;
        uint16 maxLiquidityRatio;
        uint16 borrowFeesRatio;
        uint16 insuranceRatio;
        uint16 poolReturnsRatio;
        uint16 liquidateFeesRatio;
        uint16 liquidatorReturnsRatio;
        uint16 liquidateInsuranceRatio;
        uint16 liquidatePoolReturnsRatio;
        uint16 liquidateMaxLiquidityRatio;
        uint16 twapDuration;
    }

    struct LiquidationConf {
        uint128 liquidatorXOLEHeld;
        uint8 priceDiffRatio;
        address buyBack;
    }

    struct Liquidity {
        uint256 token0Liq;
        uint256 token1Liq;
    }
}
