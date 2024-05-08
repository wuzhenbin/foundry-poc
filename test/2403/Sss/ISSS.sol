// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@interface/IERC20.sol";

interface ISSS is IERC20 {
    function maxAmountPerTx() external view returns (uint256);

    function burn(uint256) external;
}
