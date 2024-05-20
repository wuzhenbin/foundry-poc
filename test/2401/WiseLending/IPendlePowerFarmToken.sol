// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IPendlePowerFarmToken {
    function MAX_CARDINALITY() external view returns (uint16);

    function PENDLE_CONTROLLER() external view returns (address);

    function PENDLE_MARKET() external view returns (address);

    function PENDLE_POWER_FARM_CONTROLLER() external view returns (address);

    function UNDERLYING_PENDLE_MARKET() external view returns (address);

    function addCompoundRewards(uint256 _amount) external;

    function allowance(
        address _owner,
        address _spender
    ) external view returns (uint256);

    function approve(address _spender, uint256 _amount) external returns (bool);

    function balanceOf(address _account) external view returns (uint256);

    function changeMintFee(uint256 _newFee) external;

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address _spender,
        uint256 _subtractedValue
    ) external returns (bool);

    function depositExactAmount(
        uint256 _underlyingLpAssetAmount
    ) external returns (uint256, uint256);

    function increaseAllowance(
        address _spender,
        uint256 _addedValue
    ) external returns (bool);

    function lastInteraction() external view returns (uint256);

    function manualSync() external returns (bool);

    function mintFee() external view returns (uint256);

    function name() external view returns (string memory);

    function previewAmountWithdrawShares(
        uint256 _shares,
        uint256 _underlyingLpAssetsCurrent
    ) external view returns (uint256);

    function previewBurnShares(
        uint256 _underlyingAssetAmount,
        uint256 _underlyingLpAssetsCurrent
    ) external view returns (uint256);

    function previewDistribution() external view returns (uint256);

    function previewMintShares(
        uint256 _underlyingAssetAmount,
        uint256 _underlyingLpAssetsCurrent
    ) external view returns (uint256);

    function previewUnderlyingLpAssets() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalLpAssets() external view returns (uint256);

    function totalLpAssetsToDistribute() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address _to, uint256 _amount) external returns (bool);

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external returns (bool);

    function underlyingLpAssetsCurrent() external view returns (uint256);

    function withdrawExactAmount(
        uint256 _underlyingLpAssetAmount
    ) external returns (uint256);

    function withdrawExactShares(uint256 _shares) external returns (uint256);
}
