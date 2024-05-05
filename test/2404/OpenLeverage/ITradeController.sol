// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ITradeController {
    event ChangeAllowedDepositTokens(address[] token, bool allowed);
    event Liquidation(
        address owner,
        uint16 marketId,
        bool longToken,
        bool depositToken,
        uint256 liquidationAmount,
        uint256 outstandingAmount,
        address liquidator,
        uint256 depositDecrease,
        uint256 depositReturn,
        uint256 fees,
        uint256 token0Price,
        uint256 penalty,
        uint32 dex
    );
    event MarginTrade(
        address trader,
        uint16 marketId,
        bool longToken,
        bool depositToken,
        uint256 deposited,
        uint256 borrowed,
        uint256 held,
        uint256 fees,
        uint256 token0Price,
        uint32 dex
    );
    event NewAddressConfig(address controller, address dexAggregator);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewCalculateConfig(
        uint16 defaultFeesRate,
        uint8 insuranceRatio,
        uint16 defaultMarginLimit,
        uint16 priceDiffientRatio,
        uint16 updatePriceDiscount,
        uint16 feesDiscount,
        uint128 feesDiscountThreshold,
        uint16 penaltyRatio,
        uint8 maxLiquidationPriceDiffientRatio,
        uint16 twapDuration
    );
    event NewMarketConfig(
        uint16 marketId,
        uint16 feesRate,
        uint32 marginLimit,
        uint16 priceDiffientRatio,
        uint32[] dexs
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event TradeClosed(
        address owner,
        uint16 marketId,
        bool longToken,
        bool depositToken,
        uint256 closeAmount,
        uint256 depositDecrease,
        uint256 depositReturn,
        uint256 fees,
        uint256 token0Price,
        uint32 dex
    );

    function acceptAdmin() external;

    function activeTrades(
        address,
        uint16,
        bool
    )
        external
        view
        returns (
            uint256 deposited,
            uint256 held,
            bool depositToken,
            uint128 lastBlockNum
        );

    function addMarket(
        address pool0,
        address pool1,
        uint16 marginLimit,
        bytes memory dexData
    ) external returns (uint16);

    function addressConfig()
        external
        view
        returns (
            address dexAggregator,
            address controller,
            address wETH,
            address xOLE
        );

    function admin() external view returns (address);

    function calculateConfig()
        external
        view
        returns (
            uint16 defaultFeesRate,
            uint8 insuranceRatio,
            uint16 defaultMarginLimit,
            uint16 priceDiffientRatio,
            uint16 updatePriceDiscount,
            uint16 feesDiscount,
            uint128 feesDiscountThreshold,
            uint16 penaltyRatio,
            uint8 maxLiquidationPriceDiffientRatio,
            uint16 twapDuration
        );

    function closeTrade(
        uint16 marketId,
        bool longToken,
        uint256 closeHeld,
        uint256 minOrMaxAmount,
        bytes memory dexData
    ) external returns (uint256);

    function closeTradeFor(
        address trader,
        uint16 marketId,
        bool longToken,
        uint256 closeHeld,
        uint256 minOrMaxAmount,
        bytes memory dexData
    ) external returns (uint256);

    function developer() external view returns (address);

    function getMarketSupportDexs(
        uint16 marketId
    ) external view returns (uint32[] memory);

    function implementation() external view returns (address);

    function initialize(
        address _controller,
        address _dexAggregator,
        address[] memory depositTokens,
        address _wETH,
        address _xOLE,
        uint8[] memory _supportDexs
    ) external;

    function liquidate(
        address owner,
        uint16 marketId,
        bool longToken,
        uint256 minBuy,
        uint256 maxSell,
        bytes memory dexData
    ) external;

    function marginRatio(
        address owner,
        uint16 marketId,
        bool longToken,
        bytes memory dexData
    )
        external
        view
        returns (uint256 current, uint256 cAvg, uint256 hAvg, uint32 limit);

    function marginTrade(
        uint16 marketId,
        bool longToken,
        bool depositToken,
        uint256 deposit,
        uint256 borrow,
        uint256 minBuyAmount,
        bytes memory dexData
    ) external payable returns (uint256);

    function marginTradeFor(
        address trader,
        uint16 marketId,
        bool longToken,
        bool depositToken,
        uint256 deposit,
        uint256 borrow,
        uint256 minBuyAmount,
        bytes memory dexData
    ) external payable returns (uint256);

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
            uint16 marginLimit,
            uint16 feesRate,
            uint16 priceDiffientRatio,
            address priceUpdater,
            uint256 pool0Insurance,
            uint256 pool1Insurance
        );

    function moveInsurance(
        uint16 marketId,
        uint8 poolIndex,
        address to,
        uint256 amount
    ) external;

    function numPairs() external view returns (uint16);

    function opLimitOrder() external view returns (address);

    function payoffTrade(uint16 marketId, bool longToken) external payable;

    function pendingAdmin() external view returns (address);

    function router1inch() external view returns (address);

    function setAddressConfig(
        address controller,
        address dexAggregator
    ) external;

    function setCalculateConfig(
        uint16 defaultFeesRate,
        uint8 insuranceRatio,
        uint16 defaultMarginLimit,
        uint16 priceDiffientRatio,
        uint16 updatePriceDiscount,
        uint16 feesDiscount,
        uint128 feesDiscountThreshold,
        uint16 penaltyRatio,
        uint8 maxLiquidationPriceDiffientRatio,
        uint16 twapDuration
    ) external;

    function setMarketConfig(
        uint16 marketId,
        uint16 feesRate,
        uint16 marginLimit,
        uint16 priceDiffientRatio,
        uint32[] memory dexs
    ) external;

    function setOpLimitOrder(address _opLimitOrder) external;

    function setPendingAdmin(address newPendingAdmin) external;

    function setRouter1inch(address _router1inch) external;

    function setSupportDex(uint8 dex, bool support) external;

    function setTaxRate(
        uint16 marketId,
        address token,
        uint256 index,
        uint24 tax
    ) external;

    function supportDexs(uint8) external view returns (bool);

    function taxes(uint16, address, uint256) external view returns (uint24);

    function totalHelds(address) external view returns (uint256);

    function updatePrice(uint16 marketId, bytes memory dexData) external;
}
