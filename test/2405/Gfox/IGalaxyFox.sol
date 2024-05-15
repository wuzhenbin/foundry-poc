// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IGalaxyFox {
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function burn(uint256 amount) external;

    function buyTax()
        external
        view
        returns (uint16 liquidity, uint16 marketing, uint16 ecosystem);

    function decimals() external view returns (uint8);

    function ecosystemHolder() external view returns (address);

    function isExcludedFromDailyVolume(address) external view returns (bool);

    function isExcludedFromFee(address) external view returns (bool);

    function isPair(address) external view returns (bool);

    function liquidityHolder() external view returns (address);

    function liquidityReserves() external view returns (uint256);

    function liquify() external;

    function marketingHolder() external view returns (address);

    function maxDailyVolume() external view returns (uint256);

    function miniBeforeLiquify() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function recoverLostTokens(address tokenAddress) external;

    function renounceOwnership() external;

    function sellTax()
        external
        view
        returns (uint16 liquidity, uint16 marketing, uint16 ecosystem);

    function setBuyTax(
        uint16 _liquidity,
        uint16 _marketing,
        uint16 _ecosystem
    ) external;

    function setEcosystemHolder(address _ecosystemHolder) external;

    function setExcludedFromFee(address account, bool excluded) external;

    function setExludedFromDailyVolume(address account, bool excluded) external;

    function setLiquidityHolder(address _liquidityHolder) external;

    function setMarketingHolder(address _marketingHolder) external;

    function setMaxDailyVolume(uint256 maxDailyVolumeArg) external;

    function setMiniBeforeLiquify(uint256 miniBeforeLiquifyArg) external;

    function setPair(address pair, bool isPairArg) external;

    function setSellTax(
        uint16 _liquidity,
        uint16 _marketing,
        uint16 _ecosystem
    ) external;

    function setTaxEnabled(bool taxEnabledArg) external;

    function symbol() external view returns (string memory);

    function taxEnabled() external view returns (bool);

    function totalSupply() external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function uniFactory() external view returns (address);

    function uniPair() external view returns (address);

    function uniRouter() external view returns (address);

    function volume(address, uint256) external view returns (uint256);

    function weth() external view returns (address);

    receive() external payable;
}
