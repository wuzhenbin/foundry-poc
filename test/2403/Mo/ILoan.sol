// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ILoan {
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error Finished();
    error InvalidAmount();
    error InvalidDuration();
    error InvalidIndex();
    error NotExpired();
    error NotOperator();
    error OwnableInvalidOwner(address owner);
    error OwnableUnauthorizedAccount(address account);
    error SafeERC20FailedOperation(address token);
    event BorrowOrderCreated(
        address indexed user,
        uint256 amount,
        uint256 total,
        uint256 duration,
        uint256 rate,
        uint256 index
    );
    event BorrowOrderFinished(
        address indexed user,
        uint256 index,
        uint256 amount,
        uint256 interest
    );
    event MORewardClaimed(address indexed user, uint256 reward);
    event OperatorUpdated(address indexed operator, bool state);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event ReferralRewardClaimed(address indexed user, uint256 reward);
    event SupplyOrderCreated(
        address indexed user,
        uint256 amount,
        uint256 duration,
        uint256 rate,
        uint256 index
    );
    event SupplyOrderFinished(address indexed user, uint256 index);
    event SupplyRewardClaimed(
        address indexed user,
        uint256 reward,
        uint256 index
    );

    function BASE() external view returns (uint256);

    function BURN() external view returns (address);

    function approveProxy() external view returns (address);

    function balanceOf(address) external view returns (uint256);

    function borrow(uint256 amount, uint256 duration) external;

    function borrowMinAmount() external view returns (uint256);

    function borrowOrders(
        address,
        uint256
    )
        external
        view
        returns (
            uint256 amount,
            uint256 total,
            uint256 duration,
            uint256 startedTime,
            uint256 expiredTime,
            uint256 interestRate,
            bool finished
        );

    function borrowOrdersCount(address) external view returns (uint256);

    function borrowOverCollateral() external view returns (uint256);

    function borrowRates(uint256) external view returns (uint256);

    function borrowToken() external view returns (address);

    function burnRate() external view returns (uint256);

    function earned(
        address user,
        uint256 index
    ) external view returns (uint256);

    function earnedMO(address user) external view returns (uint256);

    function getReward(uint256 index) external;

    function getRewardMO() external;

    function interest(
        address user,
        uint256 index
    ) external view returns (uint256);

    function inviteRewardRate() external view returns (uint256);

    function multiples(uint256) external view returns (uint256);

    function operators(address) external view returns (bool);

    function owner() external view returns (address);

    function pair() external view returns (address);

    function poolV2() external view returns (address);

    function price() external view returns (uint256);

    function redeem(uint256 index) external;

    function redeemRate() external view returns (uint256);

    function relationship() external view returns (address);

    function renounceOwnership() external;

    function rewardPerTokenStored() external view returns (uint256);

    function rewards(address) external view returns (uint256);

    function router() external view returns (address);

    function setBorrowBurnRate(uint256 _burnRate) external;

    function setBorrowMinAmount(uint256 _amount) external;

    function setBorrowOverCollateral(uint256 _borrowOverCollateral) external;

    function setBorrowRates(uint256 _period, uint256 _borrowRate) external;

    function setFeeToSetter(address _feeToSetter) external;

    function setInviteRewardRate(uint256 _rewardRate) external;

    function setOperator(address _operator, bool _state) external;

    function setRedeemRate(uint256 _redeemRate) external;

    function setSupplyMaxAmount(uint256 _amount) external;

    function setSupplyMinAmount(uint256 _amount) external;

    function setSupplyRates(uint256 _period, uint256 _supplyRate) external;

    function setSupplyRewardRates(
        uint256 _period,
        uint256 _rewardRate
    ) external;

    function supply(uint256 amount, uint256 duration) external;

    function supplyMaxAmount() external view returns (uint256);

    function supplyMinAmount() external view returns (uint256);

    function supplyOrders(
        address,
        uint256
    )
        external
        view
        returns (
            uint256 amount,
            uint256 duration,
            uint256 startedTime,
            uint256 expiredTime,
            uint256 rewardRate,
            uint256 claimedRewards,
            bool finished
        );

    function supplyOrdersCount(address) external view returns (uint256);

    function supplyRates(uint256) external view returns (uint256);

    function supplyRewardRates(uint256) external view returns (uint256);

    function supplyToken() external view returns (address);

    function totalReferralRewardOf(address) external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function totalSupplyOf(address) external view returns (uint256);

    function totalSupplyRewardOf(address) external view returns (uint256);

    function transfer(address token, address to, uint256 amount) external;

    function transferOwnership(address newOwner) external;

    function transferOwnershipToken(address newOwner) external;

    function userRewardPerTokenPaid(address) external view returns (uint256);

    function userRewardStored(address) external view returns (uint256);

    function withdraw(uint256 index) external;
}
