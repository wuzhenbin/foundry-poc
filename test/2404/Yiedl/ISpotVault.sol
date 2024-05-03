// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ISpotVault {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event DepositableAssetUpdated(address indexed token, bool indexed added);
    event DiscountPolicyUpdated(address discountPolicy);
    event FeeCollected(address indexed feeCollectionToken, uint256 feeAmount);
    event FeeDetailsUpdated(
        uint256 depositFeePercentage,
        uint256 redeemFeePercentage,
        uint256 rotationFeePercentage,
        address feeRecipient,
        address feeAsset
    );
    event MaxAssetsUpdated(uint256 newMaxAssets);
    event OracleUpdated(address newAddress);
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RotationFeeCollected(uint256 indexed weekNumber, uint256 usdValue);
    event SlippageToleranceUpdated(
        uint8 indexed slippageType,
        uint256 tolerance
    );
    event Transaction(
        bool indexed isDeposit,
        address indexed user,
        address indexed txAsset,
        uint256 txAmount,
        uint256 shares
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function DIRECT_SWAP_ROUTER() external view returns (address);

    function FEE_INTERVAL() external view returns (uint256);

    function MASTER() external view returns (bytes32);

    function NATIVE_TOKEN() external view returns (address);

    function ONE_INCH_AGG_ROUTER() external view returns (address);

    function OPERATOR() external view returns (bytes32);

    function ORACLE_MGR() external view returns (bytes32);

    function ROTATOR() external view returns (bytes32);

    function UNIT() external view returns (uint256);

    function addDepositableAsset(address token, uint24 fee) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function approveAsset(
        address token,
        address spender,
        uint256 amount
    ) external;

    function balanceOf(address account) external view returns (uint256);

    function collectFee() external;

    function decimals() external view returns (uint8);

    function deposit(
        address token,
        uint256 amountIn,
        uint256 minSharesToReceive,
        bytes[] memory dataList,
        bytes memory feeSwapData,
        bool useDiscount
    ) external returns (uint256 sharesToMint);

    function depositNative(
        uint256 minSharesToReceive,
        bytes[] memory dataList,
        uint256[] memory nativeAmounts,
        bytes memory feeSwapData,
        bool useDiscount
    ) external payable returns (uint256 sharesToMint);

    function directPoolSwapFee(address) external view returns (uint24);

    function discountPolicy() external view returns (address);

    function feeAsset() external view returns (address);

    function feePercentages(uint8) external view returns (uint256);

    function feeRecipient() external view returns (address);

    function feeRecord(uint256) external view returns (uint256);

    function getAllocations()
        external
        view
        returns (
            uint256 aumInUsd,
            address[] memory assets,
            uint256[] memory prices,
            uint256[] memory usdValues
        );

    function getDepositableAssets() external view returns (address[] memory);

    function getNav() external view returns (uint256 nav);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function getRoleMember(
        bytes32 role,
        uint256 index
    ) external view returns (address);

    function getRoleMemberCount(bytes32 role) external view returns (uint256);

    function grantRole(bytes32 role, address account) external;

    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);

    function maxAssets() external view returns (uint256);

    function name() external view returns (string memory);

    function oracle() external view returns (address);

    function redeem(
        uint256 sharesToRedeem,
        address receivingAsset,
        uint256 minTokensToReceive,
        bytes[] memory dataList,
        bool useDiscount
    ) external returns (uint256 tokensToReturn);

    function removeDepositableAsset(address token) external;

    function renounceRole(bytes32 role, address callerConfirmation) external;

    function revokeRole(bytes32 role, address account) external;

    function rotationSwaps(
        address[] memory srcTokens,
        address[] memory dstTokens,
        bytes[] memory dataList,
        uint256[] memory nativeAmounts
    ) external;

    function slippageTolerances(uint8) external view returns (uint256);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function updateDiscountPolicy(address newDiscountPolicy) external;

    function updateFeeDetails(
        uint256 newDepositFeePercentage,
        uint256 newRedeemFeePercentage,
        uint256 newRotationFeePercentage,
        address newFeeRecipient,
        address newFeeAsset,
        bool useUniswapFlag
    ) external;

    function updateMaxAssets(uint256 newMaxAssets) external;

    function updateOracle(address newOracle) external;

    function updateSlippageTolerance(
        uint8 slippageType,
        uint256 tolerance
    ) external;

    function useUniswap() external view returns (bool);

    receive() external payable;
}
