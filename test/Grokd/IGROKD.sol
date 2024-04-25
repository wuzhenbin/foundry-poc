// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IGROKD {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Paused(address account);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Unpaused(address account);

    function LiquiditySharePool() external view returns (address);

    function SwapRouter() external view returns (address);

    function WETH() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function automatedMarketMakerPairs(address) external view returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function basePair() external view returns (address);

    function buyFee() external view returns (uint256);

    function decimals() external view returns (uint8);

    function foundationAddress() external view returns (address);

    function isExcludeFee(address) external view returns (bool);

    function isSwap(
        address from,
        address to
    ) external view returns (bool isSell, bool isBuy);

    function labAddress() external view returns (address);

    function launch(uint256 buy, uint256 sell) external;

    function launched() external view returns (bool);

    function manager() external view returns (address);

    function marketAddress() external view returns (address);

    function multiSetExcludeFee(
        address[] memory users,
        bool isExclude
    ) external;

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function pause() external;

    function paused() external view returns (bool);

    function renounceOwnership() external;

    function sellFee() external view returns (uint256);

    function setAddress(uint8 _type, address to) external;

    function setAutomatedMarketMakerPairs(address _pair, bool _isPair) external;

    function setFees(uint256 buy, uint256 sell) external;

    function setLiquiditySharePool(address addr) external;

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function unpause() external;

    receive() external payable;
}
