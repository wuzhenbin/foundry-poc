// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IERC314 {
    event AddLiquidity(uint256 _blockToUnlockLiquidity, uint256 value);
    event RemoveLiquidity(uint256 value);
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function addHolder(address addr) external;

    function addLiquidity(uint256 _blockToUnlockLiquidity) external payable;

    function balanceOf(address account) external view returns (uint256);

    function blockToUnlockLiquidity() external view returns (uint256);

    function burnTax() external view returns (uint256);

    function decimals() external view returns (uint8);

    function dividendGas() external view returns (uint256);

    function dividendTracker() external view returns (address);

    function enableTrading(bool _tradingEnable) external;

    function ethBalance() external view returns (uint256);

    function extendLiquidityLock(uint32 _blockToUnlockLiquidity) external;

    function getAmountOut(
        uint256 value,
        bool _buy
    ) external view returns (uint256);

    function getReserves() external view returns (uint256, uint256);

    function hourBurn() external;

    function hourBurnTime() external view returns (uint256);

    function isExcludedFromFee(address) external view returns (bool);

    function liquidityAdded() external view returns (bool);

    function liquidityProvider() external view returns (address);

    function lpTax() external view returns (uint256);

    function markeTax() external view returns (uint256);

    function marketAddress() external view returns (address);

    function marketingTax() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function removeLiquidity() external;

    function renounceOwnership() external;

    function setBurnTax(uint256 value) external;

    function setDividendGas(uint256 vgas) external;

    function setLpTax(uint256 value) external;

    function setMarketAddress(address addr) external;

    function setMarketingTax(uint256 value) external;

    function setTXfee(uint256 value) external;

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function tradingEnable() external view returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function txfee() external view returns (uint256);

    receive() external payable;
}
