// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ISilo {
    error AssetDoesNotExist();
    error BorrowNotPossible();
    error DepositNotPossible();
    error DepositsExceedLimit();
    error DifferentArrayLength();
    error InvalidRepository();
    error InvalidSiloVersion();
    error LiquidationReentrancyCall();
    error MaximumLTVReached();
    error NotEnoughDeposits();
    error NotEnoughLiquidity();
    error NotSolvent();
    error OnlyRouter();
    error Paused();
    error TokenIsNotAContract();
    error UnexpectedEmptyReturn();
    error UnsupportedLTVType();
    error UserIsZero();
    error ZeroAssets();
    error ZeroShares();
    event AssetStatusUpdate(address indexed asset, uint8 indexed status);
    event Borrow(address indexed asset, address indexed user, uint256 amount);
    event Deposit(
        address indexed asset,
        address indexed depositor,
        uint256 amount,
        bool collateralOnly
    );
    event Liquidate(
        address indexed asset,
        address indexed user,
        uint256 shareAmountRepaid,
        uint256 seizedCollateral
    );
    event Repay(address indexed asset, address indexed user, uint256 amount);
    event Withdraw(
        address indexed asset,
        address indexed depositor,
        address indexed receiver,
        uint256 amount,
        bool collateralOnly
    );

    function VERSION() external view returns (uint128);

    function accrueInterest(address _asset) external returns (uint256 interest);

    function assetStorage(
        address _asset
    ) external view returns (IBaseSilo.AssetStorage memory);

    function borrow(
        address _asset,
        uint256 _amount
    ) external returns (uint256 debtAmount, uint256 debtShare);

    function borrowFor(
        address _asset,
        address _borrower,
        address _receiver,
        uint256 _amount
    ) external returns (uint256 debtAmount, uint256 debtShare);

    function borrowPossible(
        address _asset,
        address _borrower
    ) external view returns (bool);

    function deposit(
        address _asset,
        uint256 _amount,
        bool _collateralOnly
    ) external returns (uint256 collateralAmount, uint256 collateralShare);

    function depositFor(
        address _asset,
        address _depositor,
        uint256 _amount,
        bool _collateralOnly
    ) external returns (uint256 collateralAmount, uint256 collateralShare);

    function depositPossible(
        address _asset,
        address _depositor
    ) external view returns (bool);

    function flashLiquidate(
        address[] memory _users,
        bytes memory _flashReceiverData
    )
        external
        returns (
            address[] memory assets,
            uint256[][] memory receivedCollaterals,
            uint256[][] memory shareAmountsToRepay
        );

    function getAssets() external view returns (address[] memory assets);

    function getAssetsWithState()
        external
        view
        returns (
            address[] memory assets,
            IBaseSilo.AssetStorage[] memory assetsStorage
        );

    function harvestProtocolFees()
        external
        returns (uint256[] memory harvestedAmounts);

    function initAssetsTokens() external;

    function interestData(
        address _asset
    ) external view returns (IBaseSilo.AssetInterestData memory);

    function isSolvent(address _user) external view returns (bool);

    function liquidity(address _asset) external view returns (uint256);

    function repay(
        address _asset,
        uint256 _amount
    ) external returns (uint256 repaidAmount, uint256 repaidShare);

    function repayFor(
        address _asset,
        address _borrower,
        uint256 _amount
    ) external returns (uint256 repaidAmount, uint256 repaidShare);

    function siloAsset() external view returns (address);

    function siloRepository() external view returns (address);

    function syncBridgeAssets() external;

    function utilizationData(
        address _asset
    ) external view returns (IBaseSilo.UtilizationData memory data);

    function withdraw(
        address _asset,
        uint256 _amount,
        bool _collateralOnly
    ) external returns (uint256 withdrawnAmount, uint256 withdrawnShare);

    function withdrawFor(
        address _asset,
        address _depositor,
        address _receiver,
        uint256 _amount,
        bool _collateralOnly
    ) external returns (uint256 withdrawnAmount, uint256 withdrawnShare);
}

interface IBaseSilo {
    struct AssetStorage {
        address collateralToken;
        address collateralOnlyToken;
        address debtToken;
        uint256 totalDeposits;
        uint256 collateralOnlyDeposits;
        uint256 totalBorrowAmount;
    }

    struct AssetInterestData {
        uint256 harvestedProtocolFees;
        uint256 protocolFees;
        uint64 interestRateTimestamp;
        uint8 status;
    }

    struct UtilizationData {
        uint256 totalDeposits;
        uint256 totalBorrowAmount;
        uint64 interestRateTimestamp;
    }
}
