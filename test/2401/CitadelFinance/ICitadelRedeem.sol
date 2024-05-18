// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ICitadelRedeem {
    function CIT() external view returns (address);

    function CITStaking() external view returns (address);

    function USDC() external view returns (address);

    function WETH() external view returns (address);

    function bCIT() external view returns (address);

    function camelotRouter() external view returns (address);

    function getTotalTreasuryBalance() external view returns (uint256);

    function getTotalbCITRedeemedByUser(
        address user
    ) external view returns (uint256);

    function maxRedeemableFixed() external view returns (uint256);

    function maxRedeemableVariable() external view returns (uint256);

    function owner() external view returns (address);

    function redeem(
        uint256 underlying,
        uint256 token,
        uint256 amount,
        uint8 rate
    ) external;

    function renounceOwnership() external;

    function setCIT(address _CIT) external;

    function setCITStaking(address _CITStaking) external;

    function setMaxRedeemableFixed(uint256 _maxRedeemableFixed) external;

    function setMaxRedeemableVariable(uint256 _maxRedeemableVariable) external;

    function setTreasury(address _treasury) external;

    function setbCIT(address _bCIT) external;

    function transferOwnership(address newOwner) external;

    function treasury() external view returns (address);
}
