// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IHypervisor {
    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PRECISION() external view returns (uint256);

    function addLiquidity(
        int24 tickLower,
        int24 tickUpper,
        uint256 amount0,
        uint256 amount1,
        uint256[2] memory inMin
    ) external;

    function algebraMintCallback(
        uint256 amount0,
        uint256 amount1,
        bytes memory data
    ) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function baseLower() external view returns (int24);

    function baseUpper() external view returns (int24);

    function compound(
        uint256[4] memory inMin
    )
        external
        returns (
            uint128 baseToken0Owed,
            uint128 baseToken1Owed,
            uint128 limitToken0Owed,
            uint128 limitToken1Owed
        );

    function currentTick() external view returns (int24 tick);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function deposit(
        uint256 deposit0,
        uint256 deposit1,
        address to,
        address from,
        uint256[4] memory inMin
    ) external returns (uint256 shares);

    function deposit0Max() external view returns (uint256);

    function deposit1Max() external view returns (uint256);

    function directDeposit() external view returns (bool);

    function fee() external view returns (uint8);

    function feeRecipient() external view returns (address);

    function getBasePosition()
        external
        view
        returns (uint128 liquidity, uint256 amount0, uint256 amount1);

    function getLimitPosition()
        external
        view
        returns (uint128 liquidity, uint256 amount0, uint256 amount1);

    function getTotalAmounts()
        external
        view
        returns (uint256 total0, uint256 total1);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function limitLower() external view returns (int24);

    function limitUpper() external view returns (int24);

    function maxTotalSupply() external view returns (uint256);

    function name() external view returns (string memory);

    function nonces(address owner) external view returns (uint256);

    function owner() external view returns (address);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function pool() external view returns (address);

    function pullLiquidity(
        int24 tickLower,
        int24 tickUpper,
        uint128 shares,
        uint256[2] memory amountMin
    ) external returns (uint256 amount0, uint256 amount1);

    function rebalance(
        int24 _baseLower,
        int24 _baseUpper,
        int24 _limitLower,
        int24 _limitUpper,
        address _feeRecipient,
        uint256[4] memory inMin,
        uint256[4] memory outMin
    ) external;

    function removeWhitelisted() external;

    function setFee(uint8 newFee) external;

    function setTickSpacing(int24 newTickSpacing) external;

    function setWhitelist(address _address) external;

    function symbol() external view returns (string memory);

    function tickSpacing() external view returns (int24);

    function toggleDirectDeposit() external;

    function token0() external view returns (address);

    function token1() external view returns (address);

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

    function whitelistedAddress() external view returns (address);

    function withdraw(
        uint256 shares,
        address to,
        address from,
        uint256[4] memory minAmounts
    ) external returns (uint256 amount0, uint256 amount1);
}
