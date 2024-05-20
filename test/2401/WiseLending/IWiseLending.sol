// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface PoolManager {
    struct CreatePool {
        bool allowBorrow;
        address poolToken;
        uint256 poolMulFactor;
        uint256 poolCollFactor;
        uint256 maxDepositAmount;
    }

    struct CurvePoolSettings {
        CurveSwapStructData curveSecuritySwapsData;
        CurveSwapStructToken curveSecuritySwapsToken;
    }
}

struct CurveSwapStructData {
    address curvePool;
    address curveMetaPool;
    bytes swapBytesPool;
    bytes swapBytesMeta;
}

struct CurveSwapStructToken {
    uint256 curvePoolTokenIndexFrom;
    uint256 curvePoolTokenIndexTo;
    uint256 curveMetaPoolTokenIndexFrom;
    uint256 curveMetaPoolTokenIndexTo;
}

interface IWiseLending {
    function POSITION_NFT() external view returns (address);

    function WETH_ADDRESS() external view returns (address);

    function WISE_ORACLE() external view returns (address);

    function WISE_SECURITY() external view returns (address);

    function algorithmData(
        address
    )
        external
        view
        returns (
            bool increasePole,
            uint256 bestPole,
            uint256 maxValue,
            uint256 previousValue
        );

    function allowance(
        address,
        address,
        address
    ) external view returns (uint256);

    function approve(
        address _spender,
        address _poolToken,
        uint256 _amount
    ) external;

    function borrowExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external returns (uint256);

    function borrowExactAmountETH(
        uint256 _nftId,
        uint256 _amount
    ) external returns (uint256);

    function borrowOnBehalfExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external returns (uint256);

    function borrowPoolData(
        address
    )
        external
        view
        returns (
            bool allowBorrow,
            uint256 pseudoTotalBorrowAmount,
            uint256 totalBorrowShares,
            uint256 borrowRate
        );

    function borrowRatesData(
        address
    )
        external
        view
        returns (
            uint256 pole,
            uint256 deltaPole,
            uint256 minPole,
            uint256 maxPole,
            uint256 multiplicativeFactor
        );

    function calculateBorrowShares(
        address _poolToken,
        uint256 _amount,
        bool _maxSharePrice
    ) external view returns (uint256);

    function calculateLendingShares(
        address _poolToken,
        uint256 _amount,
        bool _maxSharePrice
    ) external view returns (uint256);

    function cashoutAmount(
        address _poolToken,
        uint256 _shares
    ) external view returns (uint256);

    function checkDeposit(
        uint256 _nftId,
        address _caller,
        address _poolToken,
        uint256 _amount
    ) external view;

    function checkPositionLocked(uint256 _nftId, address _caller) external view;

    function claimOwnership() external;

    function collateralizeDeposit(uint256 _nftId, address _poolToken) external;

    function coreLiquidationIsolationPools(
        uint256 _nftId,
        uint256 _nftIdLiquidator,
        address _caller,
        address _receiver,
        address _paybackToken,
        address _receiveToken,
        uint256 _paybackAmount,
        uint256 _shareAmountToPay
    ) external returns (uint256);

    function corePaybackFeeManager(
        address _poolToken,
        uint256 _nftId,
        uint256 _amount,
        uint256 _shares
    ) external;

    function createCurvePool(
        PoolManager.CreatePool memory _params,
        PoolManager.CurvePoolSettings memory _settings
    ) external;

    function createPool(PoolManager.CreatePool memory _params) external;

    function depositExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external returns (uint256);

    function depositExactAmountETH(
        uint256 _nftId
    ) external payable returns (uint256);

    function depositExactAmountETHMint() external payable returns (uint256);

    function depositExactAmountMint(
        address _poolToken,
        uint256 _amount
    ) external returns (uint256);

    function getPositionBorrowShares(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getPositionBorrowTokenByIndex(
        uint256 _nftId,
        uint256 _index
    ) external view returns (address);

    function getPositionBorrowTokenLength(
        uint256 _nftId
    ) external view returns (uint256);

    function getPositionLendingShares(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getPositionLendingTokenByIndex(
        uint256 _nftId,
        uint256 _index
    ) external view returns (address);

    function getPositionLendingTokenLength(
        uint256 _nftId
    ) external view returns (uint256);

    function getPseudoTotalBorrowAmount(
        address _poolToken
    ) external view returns (uint256);

    function getPseudoTotalPool(
        address _poolToken
    ) external view returns (uint256);

    function getPureCollateralAmount(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getTimeStamp(address _poolToken) external view returns (uint256);

    function getTotalBareToken(
        address _poolToken
    ) external view returns (uint256);

    function getTotalBorrowShares(
        address _poolToken
    ) external view returns (uint256);

    function getTotalDepositShares(
        address _poolToken
    ) external view returns (uint256);

    function getTotalPool(address _poolToken) external view returns (uint256);

    function globalPoolData(
        address
    )
        external
        view
        returns (
            uint256 totalPool,
            uint256 utilization,
            uint256 totalBareToken,
            uint256 poolFee
        );

    function isUncollateralized(
        uint256 _nftId,
        address _poolToken
    ) external view returns (bool);

    function lendingPoolData(
        address
    )
        external
        view
        returns (
            uint256 pseudoTotalPool,
            uint256 totalDepositShares,
            uint256 collateralFactor
        );

    function liquidatePartiallyFromTokens(
        uint256 _nftId,
        uint256 _nftIdLiquidator,
        address _paybackToken,
        address _receiveToken,
        uint256 _shareAmountToPay
    ) external returns (uint256);

    function master() external view returns (address);

    function maxDepositValueToken(address) external view returns (uint256);

    function newBorrowRate(address _poolToken) external;

    function paybackAmount(
        address _poolToken,
        uint256 _shares
    ) external view returns (uint256);

    function paybackExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external returns (uint256);

    function paybackExactAmountETH(
        uint256 _nftId
    ) external payable returns (uint256);

    function paybackExactShares(
        uint256 _nftId,
        address _poolToken,
        uint256 _shares
    ) external returns (uint256);

    function positionBorrowTokenData(
        uint256,
        uint256
    ) external view returns (address);

    function positionLendTokenData(
        uint256,
        uint256
    ) external view returns (address);

    function positionLocked(uint256) external view returns (bool);

    function preparePool(address _poolToken) external;

    function proposeOwner(address _proposedOwner) external;

    function pureCollateralAmount(
        uint256,
        address
    ) external view returns (uint256);

    function renounceOwnership() external;

    function sendingProgress() external view returns (bool);

    function setOnBehalf(address _contract, bool _status) external;

    function setParamsLASA(
        address _poolToken,
        uint256 _poolMulFactor,
        uint256 _upperBoundMaxRate,
        uint256 _lowerBoundMaxRate,
        bool _steppingDirection,
        bool _isFinal
    ) external;

    function setPoolFee(address _poolToken, uint256 _newFee) external;

    function setPoolParameters(
        address _poolToken,
        uint256 _collateralFactor,
        uint256 _maximumDeposit
    ) external;

    function setRegistrationIsolationPool(
        uint256 _nftId,
        bool _registerState
    ) external;

    function setSecurity(address _wiseSecurity) external;

    function setVerifiedIsolationPool(
        address _isolationPool,
        bool _state
    ) external;

    function skim(address _poolToken) external returns (uint256);

    function solelyDeposit(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external;

    function solelyDepositETH(uint256 _nftId) external payable;

    function solelyDepositETHMint() external payable;

    function solelyDepositMint(address _poolToken, uint256 _amount) external;

    function solelyWithdraw(
        uint256 _nftId,
        address _poolToken,
        uint256 _withdrawAmount
    ) external;

    function solelyWithdrawETH(uint256 _nftId, uint256 withdrawAmount) external;

    function solelyWithdrawOnBehalf(
        uint256 _nftId,
        address _poolToken,
        uint256 _withdrawAmount
    ) external;

    function syncManually(address _poolToken) external;

    function timestampsPoolData(
        address
    ) external view returns (uint256 timeStamp, uint256 timeStampScaling);

    function unCollateralizeDeposit(
        uint256 _nftId,
        address _poolToken
    ) external;

    function userBorrowShares(uint256, address) external view returns (uint256);

    function userLendingData(
        uint256,
        address
    ) external view returns (bool unCollateralized, uint256 shares);

    function verifiedIsolationPool(address) external view returns (bool);

    function withdrawExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _withdrawAmount
    ) external returns (uint256);

    function withdrawExactAmountETH(
        uint256 _nftId,
        uint256 _amount
    ) external returns (uint256);

    function withdrawExactShares(
        uint256 _nftId,
        address _poolToken,
        uint256 _shares
    ) external returns (uint256);

    function withdrawExactSharesETH(
        uint256 _nftId,
        uint256 _shares
    ) external returns (uint256);

    function withdrawOnBehalfExactAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _withdrawAmount
    ) external returns (uint256);

    function withdrawOnBehalfExactShares(
        uint256 _nftId,
        address _poolToken,
        uint256 _shares
    ) external returns (uint256);

    receive() external payable;
}
