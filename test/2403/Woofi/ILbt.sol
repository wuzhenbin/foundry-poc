// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@interface/IERC20.sol";

interface ILBFlashLoanCallback {
    function LBFlashLoanCallback(
        address sender,
        IERC20 tokenX,
        IERC20 tokenY,
        bytes32 amounts,
        bytes32 totalFees,
        bytes calldata data
    ) external returns (bytes32);
}

interface ILBTFlashloan {
    function flashLoan(
        ILBFlashLoanCallback receiver,
        bytes32 amounts,
        bytes calldata data
    ) external;
}
