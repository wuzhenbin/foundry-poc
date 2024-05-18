// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ICitadelStaking {
    function CIT() external view returns (address);

    function approveCITnbCIT(uint256 amount) external;

    function bCIT() external view returns (address);

    function claim() external;

    function claimReferralRewards() external;

    function compound(uint8 rate) external;

    function deposit(address token, uint256 amount, uint8 rate) external;

    function epochDuration() external view returns (uint256);

    function epochs(
        uint256
    )
        external
        view
        returns (
            uint256 epoch,
            bool initialized,
            uint256 totalStaked,
            uint256 rewards
        );

    function fixedRate() external view returns (uint256);

    function fullDistributionEpochs() external view returns (uint256);

    function getCITInUSDAllFixedRates(
        address user,
        uint256 amount
    ) external view returns (uint256);

    function getCurrentEpoch() external view returns (uint256);

    function getFixedRate() external view returns (uint256);

    function getNextEpoch() external view returns (uint256);

    function getTotalTokenStakedForUser(
        address user,
        uint8 rate,
        address token
    ) external view returns (uint256);

    function getUsers(address user) external view returns (uint256);

    function nextEpochRewardForUserCalculator(
        address user
    ) external view returns (uint256);

    function owner() external view returns (address);

    function redeemCalculator(
        address user
    ) external view returns (uint256[2][2] memory);

    function referralRewardsCalculator(
        address user
    ) external view returns (uint256);

    function removeStaking(
        address user,
        address token,
        uint8 rate,
        uint256 amount
    ) external;

    function renounceOwnership() external;

    function rewardsCalculator(address user) external view returns (uint256);

    function rewardsPerEpoch() external view returns (uint256);

    function setCIT(address _CIT) external;

    function setCITRedeemAddy(address _CITRedeem) external;

    function setEpochDuration(uint256 _epochDuration) external;

    function setFees(uint256 _depositFee, uint256 _withdrawFee) external;

    function setFixedRate(uint256 _fixedRate) external;

    function setFullDistributionEpochs(
        uint256 _fullDistributionEpochs
    ) external;

    function setRewardPerEpoch(uint256 _rewardsPerEpoch) external;

    function stakings(
        address,
        uint256
    )
        external
        view
        returns (
            address token,
            uint256 amount,
            uint256 redeemAmount,
            uint256 fixedRateAtStaking,
            uint256 epoch,
            uint8 rate,
            bool hasClaimedAtLeastOnce
        );

    function startEpoch() external;

    function totalStakedCIT() external view returns (uint256);

    function totalStakedbCIT() external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function withdraw(address token, uint256 amount, uint8 rate) external;
}
