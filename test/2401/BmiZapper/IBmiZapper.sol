// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IBmiZapper {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    function BMI() external view returns (address);

    function calcUSDCEquilavent(
        address _from,
        uint256 _amount
    ) external view returns (uint256);

    function getUnderlyingAmount(
        address _derivative,
        uint256 _amount
    ) external view returns (address, uint256);

    function owner() external view returns (address);

    function recoverERC20(address _token) external;

    function recoverERC20s(address[] memory _tokens) external;

    function renounceOwnership() external;

    function transferOwnership(address newOwner) external;

    function zapToBMI(
        address _from,
        uint256 _amount,
        address _fromUnderlying,
        uint256 _fromUnderlyingAmount,
        uint256 _minBMIRecv,
        address[] memory _bmiConstituents,
        uint256[] memory _bmiConstituentsWeightings,
        address _aggregator,
        bytes memory _aggregatorData,
        bool refundDust
    ) external returns (uint256);
}
