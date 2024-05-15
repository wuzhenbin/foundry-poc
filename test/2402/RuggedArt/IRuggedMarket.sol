// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface RuggedMarket {
    struct UniversalRouterExecute {
        bytes commands;
        bytes[] inputs;
        uint256 deadline;
    }
}

interface IRuggedMarket {
    function ERC721_TOTAL_SUPPLY() external view returns (uint256);

    function UNIVERSAL_ROUTER() external view returns (address);

    function UPGRADE_INTERFACE_VERSION() external view returns (string memory);

    function accRewardPerShare() external view returns (uint256);

    function addIncentive(
        uint256 _rewardTotal,
        uint256 _startTime,
        uint256 _endTime
    ) external;

    function claimReward() external returns (uint256);

    function incentives(
        uint256
    )
        external
        view
        returns (
            uint256 rewardTotal,
            uint256 startTime,
            uint256 endTime,
            uint256 rewardDistributed
        );

    function initialize(address _ruggedTokenAddress) external payable;

    function lastUpdateTime() external view returns (uint256);

    function marketFees() external view returns (uint256);

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);

    function owner() external view returns (address);

    function proxiableUUID() external view returns (bytes32);

    function renounceOwnership() external;

    function ruggedToken() external view returns (address);

    function stake(uint256 _amount) external;

    function stakeNFTs(uint256[] memory _tokenIds) external;

    function stakers(
        address
    ) external view returns (uint256 amountStaked, uint256 rewardDebt);

    function targetedPurchase(
        uint256[] memory _tokenIds,
        RuggedMarket.UniversalRouterExecute memory swapParam
    ) external payable;

    function targetedPurchase(uint256[] memory _tokenIds) external;

    function totalStaked() external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function unstake(uint256 _amount) external;

    function upgradeToAndCall(
        address newImplementation,
        bytes memory data
    ) external payable;

    receive() external payable;
}
