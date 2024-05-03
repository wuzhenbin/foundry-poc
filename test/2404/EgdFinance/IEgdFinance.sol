// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IEGD_Finance {
    event Claim(address indexed player, uint256 indexed amount);
    event Initialized(uint8 version);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Stake(address indexed player, uint256 indexed amount);

    function EGD() external view returns (address);

    function U() external view returns (address);

    function black(address) external view returns (bool);

    function bond(address invitor) external;

    function calculateAll(address addr) external view returns (uint256);

    function calculateReward(address addr, uint256 slot) external view returns (uint256);

    function checkUserRecord(address addr)
        external
        view
        returns (uint256[] memory total, uint256[] memory stakeTime, uint256[] memory claimed);

    function checkUserStakeList(address addr) external view returns (uint256[] memory);

    function claimAllReward() external;

    function dailyStake(uint256) external view returns (uint256);

    function dailyStakeLimit() external view returns (uint256);

    function fund() external view returns (address);

    function getCurrentDay() external view returns (uint256);

    function getDailyStake() external view returns (uint256);

    function getEGDPrice() external view returns (uint256);

    function getUserReferReward(address addr) external view returns (uint256, uint256);

    function initialize() external;

    function owner() external view returns (address);

    function pair() external view returns (address);

    function rate(uint256) external view returns (uint256);

    function renounceOwnership() external;

    function router() external view returns (address);

    function setBlack(address addr, bool b) external;

    function setFund(address addr) external;

    function setPair(address addr) external;

    function setRate(uint256[] memory rate_) external;

    function setRateList(uint256[] memory list_) external;

    function setRouter(address addr) external;

    function setToken(address EGD_, address usdt) external;

    function setUserisRefer(address addr, bool b) external;

    function setWallet(address addr) external;

    function stake(uint256 amount) external;

    function transferOwnership(address newOwner) external;

    function userDailyReferReward(address, uint256) external view returns (uint256);

    function userInfo(address)
        external
        view
        returns (
            uint256 totalAmount,
            uint256 totalClaimed,
            address invitor,
            bool isRefer,
            uint256 refer,
            uint256 referReward
        );

    function userSlot(address, uint256)
        external
        view
        returns (
            uint256 totalQuota,
            uint256 stakeTime,
            uint256 leftQuota,
            uint256 claimTime,
            uint256 rates,
            uint256 claimedQuota
        );

    function withDraw(address token, address wallet_, uint256 amount) external;
}

interface IEGD_FinanceProxy {
    event AdminChanged(address previousAdmin, address newAdmin);
    event BeaconUpgraded(address indexed beacon);
    event Upgraded(address indexed implementation);

    function admin() external returns (address admin_);

    function changeAdmin(address newAdmin) external;

    function implementation() external returns (address implementation_);

    function upgradeTo(address newImplementation) external;

    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
}
