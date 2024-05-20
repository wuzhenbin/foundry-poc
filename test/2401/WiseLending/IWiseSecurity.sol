// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "./IWiseLending.sol";

interface IWiseSecurity {
    function AAVE_HUB() external view returns (address);

    function FEE_MANAGER() external view returns (address);

    function POSITION_NFTS() external view returns (address);

    function WISE_LENDING() external view returns (address);

    function WISE_LIQUIDATION() external view returns (address);

    function WISE_ORACLE() external view returns (address);

    function baseRewardLiquidation() external view returns (uint256);

    function baseRewardLiquidationFarm() external view returns (uint256);

    function borrowPercentageCap() external view returns (uint256);

    function calculateWishPercentage(
        uint256 _nftId,
        address _receiveToken,
        uint256 _paybackETH,
        uint256 _maxFeeETH,
        uint256 _baseRewardLiquidation
    ) external view returns (uint256);

    function canLiquidate(
        uint256 _borrowETHTotal,
        uint256 _weightedCollateralETH
    ) external pure;

    function checkBadDebt(uint256 _nftId) external;

    function checkBadDebtThreshold(
        uint256 _borrowETHTotal,
        uint256 _unweightedCollateral
    ) external pure returns (bool);

    function checkBorrowLimit(
        uint256 _nftId,
        address _poolToken,
        uint256 _amount
    ) external view;

    function checkHeartbeat(address _poolToken) external view returns (bool);

    function checkMaxFee(
        uint256 _paybackETH,
        uint256 _feeLiquidation,
        uint256 _maxFeeETH
    ) external pure returns (uint256);

    function checkMaxShares(
        uint256 _nftId,
        address _tokenToPayback,
        uint256 _borrowETHTotal,
        uint256 _unweightedCollateralETH,
        uint256 _shareAmountToPay
    ) external view;

    function checkOwnerPosition(uint256 _nftId, address _caller) external view;

    function checkTokenAllowed(address _poolAddress) external view;

    function checkUncollateralizedDeposit(
        uint256 _nftId,
        address _poolToken
    ) external view;

    function checksBorrow(
        uint256 _nftId,
        address _caller,
        address _poolToken,
        uint256 _amount
    ) external view;

    function checksCollateralizeDeposit(
        uint256 _nftId,
        address _caller,
        address _poolAddress
    ) external view;

    function checksLiquidation(
        uint256 _nftIdLiquidate,
        address _tokenToPayback,
        uint256 _shareAmountToPay
    ) external view;

    function checksRegister(uint256 _nftId, address _caller) external view;

    function checksSolelyWithdraw(
        uint256 _nftId,
        address _caller,
        address _poolToken,
        uint256 _amount
    ) external view;

    function checksWithdraw(
        uint256 _nftId,
        address _caller,
        address _poolToken,
        uint256 _amount
    ) external view;

    function claimOwnership() external;

    function curveSecurityCheck(address _poolToken) external;

    function curveSwapInfoData(
        address
    )
        external
        view
        returns (
            address curvePool,
            address curveMetaPool,
            bytes memory swapBytesPool,
            bytes memory swapBytesMeta
        );

    function curveSwapInfoToken(
        address
    )
        external
        view
        returns (
            uint256 curvePoolTokenIndexFrom,
            uint256 curvePoolTokenIndexTo,
            uint256 curveMetaPoolTokenIndexFrom,
            uint256 curveMetaPoolTokenIndexTo
        );

    function getBorrowRate(address _poolToken) external view returns (uint256);

    function getETHBorrow(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getETHCollateral(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getETHCollateralUpdated(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval
    ) external view returns (uint256);

    function getExpectedLendingAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval
    ) external view returns (uint256);

    function getExpectedPaybackAmount(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval
    ) external view returns (uint256);

    function getFullCollateralETH(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256 ethCollateral);

    function getLendingRate(address _poolToken) external view returns (uint256);

    function getLiveDebtRatio(uint256 _nftId) external view returns (uint256);

    function getPositionBorrowAmount(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function getPositionLendingAmount(
        uint256 _nftId,
        address _poolToken
    ) external view returns (uint256);

    function master() external view returns (address);

    function maxFeeETH() external view returns (uint256);

    function maxFeeFarmETH() external view returns (uint256);

    function maximumBorrowToken(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval
    ) external view returns (uint256 tokenAmount);

    function maximumWithdrawToken(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval,
        uint256 _solelyWithdrawAmount
    ) external view returns (uint256);

    function maximumWithdrawTokenSolely(
        uint256 _nftId,
        address _poolToken,
        uint256 _interval,
        uint256 _poolWithdrawAmount
    ) external view returns (uint256);

    function overallBorrowAPY(uint256 _nftId) external view returns (uint256);

    function overallETHBorrow(
        uint256 _nftId
    ) external view returns (uint256 buffer);

    function overallETHBorrowHeartbeat(
        uint256 _nftId
    ) external view returns (uint256 buffer);

    function overallETHCollateralsBare(
        uint256 _nftId
    ) external view returns (uint256 amount);

    function overallETHCollateralsBoth(
        uint256 _nftId
    ) external view returns (uint256, uint256);

    function overallETHCollateralsWeighted(
        uint256 _nftId
    ) external view returns (uint256 weightedTotal);

    function overallLendingAPY(uint256 _nftId) external view returns (uint256);

    function overallNetAPY(
        uint256 _nftId
    ) external view returns (uint256, bool);

    function positionLocked(
        uint256 _nftId
    ) external view returns (bool, address);

    function prepareCurvePools(
        address _poolToken,
        CurveSwapStructData memory _curveSwapStructData,
        CurveSwapStructToken memory _curveSwapStructToken
    ) external;

    function proposeOwner(address _proposedOwner) external;

    function renounceOwnership() external;

    function safeLimitPosition(uint256 _nftId) external view returns (uint256);

    function setBlacklistToken(address _tokenAddress, bool _state) external;

    function setLiquidationSettings(
        uint256 _baseReward,
        uint256 _baseRewardFarm,
        uint256 _newMaxFeeETH,
        uint256 _newMaxFeeFarmETH
    ) external;

    function wasBlacklisted(address) external view returns (bool);
}
