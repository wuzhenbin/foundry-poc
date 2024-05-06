// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface ZZF {
    struct userInfo {
        address addr;
        uint256 staking;
        uint256 rewards;
        uint256 receives;
        uint256 share;
        address invitation;
        uint256 historyRewards;
        uint256 shareTokens;
    }
}

interface IZzf {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event ArriveFeeRewards(
        address indexed account,
        uint256 amount,
        uint256 totalRewards
    );
    event IncreaseStaking(
        address indexed account,
        uint256 amount,
        uint256 totalBurn
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event ReceiveReward(
        address indexed account,
        uint256 amount,
        uint256 totalReceive
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function Invitation(address) external view returns (address);

    function Rewards(address) external view returns (uint256);

    function Share(address) external view returns (uint256);

    function ShareTokens(address) external view returns (uint256);

    function _burnToken() external view returns (address);

    function _liquidityFee() external view returns (uint256);

    function _taxFee() external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function arriveFeeRewards() external payable;

    function arriveRewardsAdmin(uint256 increase) external;

    function balanceOf(address account) external view returns (uint256);

    function burnAmount(address) external view returns (uint256);

    function burnToHolder(uint256 amount, address _invitation) external;

    function canRewards(address addr) external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function excludeFromFee(address account) external;

    function excludeFromReward(address account) external;

    function getInvitationLength() external view returns (uint256);

    function getInvitationList(
        uint256 from,
        uint256 limit
    ) external view returns (ZZF.userInfo[] memory items);

    function getTime() external view returns (uint256);

    function getUnlockTime() external view returns (uint256);

    function getUserInfo(
        address addr
    ) external view returns (ZZF.userInfo memory info);

    function getUserLength() external view returns (uint256);

    function getUserList(
        uint256 from,
        uint256 limit
    ) external view returns (ZZF.userInfo[] memory items);

    function historyRewards(address) external view returns (uint256);

    function includeInFee(address account) external;

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function invFee() external view returns (uint256);

    function isExcludedFromFee(address account) external view returns (bool);

    function isExcludedFromReward(address account) external view returns (bool);

    function lock(uint256 time) external;

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function receiveRewards(address to) external;

    function reflectionFromToken(
        uint256 tAmount,
        bool deductTransferFee
    ) external view returns (uint256);

    function renounceOwnership() external;

    function setInvitation(address from) external;

    function setLiquidityFeePercent(uint256 liquidityFee) external;

    function setMainToken(address addr) external;

    function setTaxFeePercent(uint256 taxFee) external;

    function symbol() external view returns (string memory);

    function tokenFromReflection(
        uint256 rAmount
    ) external view returns (uint256);

    function totalBurn() external view returns (uint256);

    function totalReceive() external view returns (uint256);

    function totalRewards() external view returns (uint256);

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

    function uniswapRouter() external view returns (address);

    function unlock() external;

    receive() external payable;
}
