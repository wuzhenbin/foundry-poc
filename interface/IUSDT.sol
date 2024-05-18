//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IUSDT {
    function decimals() external view returns (uint8);

    function transfer(address to, uint256 value) external;

    function balanceOf(address account) external view returns (uint256);

    // 这里跟IEC20不一样 不会返回布尔值
    function approve(address spender, uint256 value) external;
}
