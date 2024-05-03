// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IStrategy {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Claimed(address user, address receiver, uint256 claimed);
    event Divested(
        address indexed pool,
        uint256 lpTokenDivested,
        uint256 baseObtained
    );
    event Drained(address indexed pool, uint256 lpTokenDivested);
    event Ejected(
        address indexed pool,
        uint256 lpTokenDivested,
        uint256 baseObtained,
        uint256 fyTokenObtained
    );
    event Invested(
        address indexed pool,
        uint256 baseInvested,
        uint256 lpTokensObtained
    );
    event RewardsPerTokenUpdated(uint256 accumulated);
    event RewardsSet(uint32 start, uint32 end, uint256 rate);
    event RewardsTokenSet(address token);
    event RoleAdminChanged(bytes4 indexed role, bytes4 indexed newAdminRole);
    event RoleGranted(
        bytes4 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes4 indexed role,
        address indexed account,
        address indexed sender
    );
    event SoldFYToken(uint256 soldFYToken, uint256 returnedBase);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event UserRewardsUpdated(
        address user,
        uint256 userRewards,
        uint256 paidRewardPerToken
    );

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function LOCK() external view returns (bytes4);

    function LOCK8605463013() external view returns (bytes4);

    function PERMIT_TYPEHASH() external view returns (bytes32);

    function ROOT() external view returns (bytes4);

    function ROOT4146650865() external view returns (bytes4);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 wad) external returns (bool);

    function balanceOf(address guy) external view returns (uint256);

    function base() external view returns (address);

    function baseCached() external view returns (uint256);

    function burn(address to) external returns (uint256 poolTokensObtained);

    function burn(
        address,
        address,
        uint256,
        uint256
    ) external returns (uint256, uint256, uint256);

    function burnDivested(address to) external returns (uint256 baseObtained);

    function burnPoolTokens(
        address pool_,
        uint256 poolTokens
    ) external returns (uint256 baseReceived, uint256 fyTokenReceived);

    function buyFYToken(
        address fyTokenTo,
        address baseTo
    ) external returns (uint256 soldFYToken, uint256 returnedBase);

    function call(
        address target,
        bytes memory data
    ) external returns (bytes memory);

    function claim(address to) external returns (uint256 claiming);

    function decimals() external view returns (uint8);

    function deploymentChainId() external view returns (uint256);

    function divest() external returns (uint256 baseObtained);

    function eject()
        external
        returns (uint256 baseReceived, uint256 fyTokenReceived);

    function fyToken() external view returns (address);

    function fyTokenCached() external view returns (uint256);

    function getRoleAdmin(bytes4 role) external view returns (bytes4);

    function grantRole(bytes4 role, address account) external;

    function grantRoles(bytes4[] memory roles, address account) external;

    function hasRole(bytes4 role, address account) external view returns (bool);

    function init(
        address to
    ) external returns (uint256 baseIn, uint256 fyTokenIn, uint256 minted);

    function invest(
        address pool_
    ) external returns (uint256 poolTokensObtained);

    function lockRole(bytes4 role) external;

    function maturity() external view returns (uint32);

    function mint(address to) external returns (uint256 minted);

    function mintDivested(address to) external returns (uint256 minted);

    function name() external view returns (string memory);

    function nonces(address) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function pool() external view returns (address);

    function poolCached() external view returns (uint256);

    function remit(address user) external returns (uint256 claiming);

    function renounceRole(bytes4 role, address account) external;

    function restart() external returns (uint256 baseIn);

    function revokeRole(bytes4 role, address account) external;

    function revokeRoles(bytes4[] memory roles, address account) external;

    function rewards(
        address
    ) external view returns (uint128 accumulated, uint128 checkpoint);

    function rewardsPerToken()
        external
        view
        returns (uint128 accumulated, uint32 lastUpdated, uint96 rate);

    function rewardsPeriod() external view returns (uint32 start, uint32 end);

    function rewardsToken() external view returns (address);

    function setRewards(uint32 start, uint32 end, uint96 rate) external;

    function setRewardsToken(address rewardsToken_) external;

    function setRoleAdmin(bytes4 role, bytes4 adminRole) external;

    function state() external view returns (uint8);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 wad) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 wad
    ) external returns (bool);

    function version() external pure returns (string memory);
}
