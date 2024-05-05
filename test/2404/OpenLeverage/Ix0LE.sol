// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IxOLE {
    event DelegateChanged(
        address indexed delegator,
        address indexed fromDelegate,
        address indexed toDelegate
    );
    event DelegateVotesChanged(
        address indexed delegate,
        uint256 previousBalance,
        uint256 newBalance
    );
    event Deposit(
        address indexed provider,
        uint256 value,
        uint256 unlocktime,
        int128 type_,
        uint256 prevBalance,
        uint256 balance
    );
    event FailedDelegateBySig(
        address indexed delegatee,
        uint256 indexed nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    );
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event RewardAdded(address fromToken, uint256 convertAmount, uint256 reward);
    event RewardConvert(
        address fromToken,
        address toToken,
        uint256 convertAmount,
        uint256 returnAmount
    );
    event RewardPaid(address paidTo, uint256 amount);
    event Supply(uint256 prevSupply, uint256 supply);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Withdraw(
        address indexed provider,
        uint256 value,
        uint256 prevBalance,
        uint256 balance
    );

    function DELEGATION_TYPEHASH() external view returns (bytes32);

    function DOMAIN_TYPEHASH() external view returns (bytes32);

    function acceptAdmin() external;

    function admin() external view returns (address);

    function balanceOf(address addr) external view returns (uint256);

    function checkpoints(
        address,
        uint32
    ) external view returns (uint32 fromBlock, uint256 votes);

    function claimableTokenAmount() external view returns (uint256);

    function convertToSharingToken(
        uint256 amount,
        uint256 minBuyAmount,
        bytes memory dexData
    ) external;

    function create_lock(uint256 _value, uint256 _unlock_time) external;

    function create_lock_for(
        address to,
        uint256 _value,
        uint256 _unlock_time
    ) external;

    function decimals() external view returns (uint8);

    function delegate(address delegatee) external;

    function delegateBySig(
        address delegatee,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function delegateBySigs(
        address delegatee,
        uint256[] memory nonce,
        uint256[] memory expiry,
        uint8[] memory v,
        bytes32[] memory r,
        bytes32[] memory s
    ) external;

    function delegates(address) external view returns (address);

    function dev() external view returns (address);

    function devFund() external view returns (uint256);

    function devFundRatio() external view returns (uint256);

    function developer() external view returns (address);

    function dexAgg() external view returns (address);

    function getCurrentVotes(address account) external view returns (uint256);

    function getPriorVotes(
        address account,
        uint256 blockNumber
    ) external view returns (uint256);

    function implementation() external view returns (address);

    function increase_amount(uint256 _value) external;

    function increase_amount_for(address to, uint256 _value) external;

    function increase_unlock_time(uint256 _unlock_time) external;

    function initialize(
        address _oleToken,
        address _dexAgg,
        uint256 _devFundRatio,
        address _dev
    ) external;

    function lastUpdateTime() external view returns (uint256);

    function locked(
        address
    ) external view returns (uint256 amount, uint256 end);

    function name() external view returns (string memory);

    function nonces(address) external view returns (uint256);

    function numCheckpoints(address) external view returns (uint32);

    function oleLpStakeAutomator() external view returns (address);

    function oleLpStakeToken() external view returns (address);

    function oleToken() external view returns (address);

    function pendingAdmin() external view returns (address);

    function rewardPerTokenStored() external view returns (uint256);

    function rewards(address) external view returns (uint256);

    function setDev(address newDev) external;

    function setDevFundRatio(uint256 newRatio) external;

    function setDexAgg(address newDexAgg) external;

    function setOleLpStakeAutomator(address _oleLpStakeAutomator) external;

    function setOleLpStakeToken(address _oleLpStakeToken) external;

    function setPendingAdmin(address newPendingAdmin) external;

    function setShareToken(address _shareToken) external;

    function shareToken() external view returns (address);

    function shareableTokenAmount() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalLocked() external view returns (uint256);

    function totalRewarded() external view returns (uint256);

    function totalStaked() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function totalSupplyAt(uint256 blockNumber) external view returns (uint256);

    function totalSupplyCheckpoints(
        uint256
    ) external view returns (uint32 fromBlock, uint256 votes);

    function totalSupplyNumCheckpoints() external view returns (uint256);

    function userRewardPerTokenPaid(address) external view returns (uint256);

    function withdraw() external;

    function withdrawCommunityFund(address to) external;

    function withdrawDevFund() external;

    function withdrawOle(address to) external;

    function withdraw_automator(address owner) external;

    function withdrewReward() external view returns (uint256);
}
