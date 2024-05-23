// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IGoodReserveCDai {
    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function MINTER_ROLE() external view returns (bytes32);

    function PAUSER_ROLE() external view returns (bytes32);

    function RESERVE_MINTER_ROLE() external view returns (bytes32);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function avatar() external view returns (address);

    function balanceOf(address account) external view returns (uint256);

    function burn(uint256 amount) external;

    function burnFrom(address account, uint256 amount) external;

    function buy(
        uint256 _tokenAmount,
        uint256 _minReturn,
        address _targetAddress
    ) external returns (uint256);

    function cDaiAddress() external view returns (address);

    function cap() external view returns (uint256);

    function currentPrice() external view returns (uint256);

    function currentPriceDAI() external view returns (uint256);

    function daiAddress() external view returns (address);

    function dao() external view returns (address);

    function decimals() external pure returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function discountDisabled() external view returns (bool);

    function distributionHelper() external view returns (address);

    function end() external;

    function gdxAirdrop() external view returns (bytes32);

    function gdxDisabled() external view returns (bool);

    function getMarketMaker() external view returns (address);

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

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function initialize(string memory name, string memory symbol) external;

    function initialize(address _ns, bytes32 _gdxAirdrop) external;

    function isClaimedGDX(address) external view returns (bool);

    function lastMinted() external view returns (uint256);

    function mint(address to, uint256 amount) external;

    function mintRewardFromRR(
        address _token,
        address _to,
        uint256 _amount
    ) external;

    function mintUBI(
        uint256 _daiToConvert,
        uint256 _startingCDAIBalance,
        address _interestToken
    ) external returns (uint256, uint256);

    function name() external view returns (string memory);

    function nameService() external view returns (address);

    function nativeToken() external view returns (address);

    function pause() external;

    function paused() external view returns (bool);

    function pre(
        address _scheme,
        bytes32 _hash,
        bytes32 _method
    ) external pure returns (bool);

    function proxiableUUID() external view returns (bytes32);

    function recover(address _token) external;

    function renounceRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function sell(
        uint256 _gdAmount,
        uint256 _minReturn,
        address _target,
        address _seller
    ) external returns (uint256, uint256);

    function setAddresses() external;

    function setDistributionHelper(address _helper) external;

    function setGDXDisabled(bool _gdxDisabled, bool _discountDisabled) external;

    function setReserveRatioDailyExpansion(
        uint256 _nom,
        uint256 _denom
    ) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function unpause() external;

    function updateAvatar() external;

    function upgradeTo(address newImplementation) external;

    function upgradeToAndCall(
        address newImplementation,
        bytes memory data
    ) external payable;

    function when() external pure returns (uint8);
}
