// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ClaimCampaigns {
    struct Campaign {
        address manager;
        address token;
        uint256 amount;
        uint256 end;
        uint8 tokenLockup;
        bytes32 root;
    }

    struct ClaimLockup {
        address tokenLocker;
        uint256 start;
        uint256 cliff;
        uint256 period;
        uint256 periods;
    }

    struct Donation {
        address tokenLocker;
        uint256 amount;
        uint256 rate;
        uint256 start;
        uint256 cliff;
        uint256 period;
    }
}

interface IClaimCampaigns {
    event CampaignCancelled(bytes16 indexed id);
    event CampaignStarted(bytes16 indexed id, ClaimCampaigns.Campaign campaign);
    event ClaimLockupCreated(
        bytes16 indexed id,
        ClaimCampaigns.ClaimLockup claimLockup
    );
    event TokensClaimed(
        bytes16 indexed id,
        address indexed claimer,
        uint256 amountClaimed,
        uint256 amountRemaining
    );
    event TokensDonated(
        bytes16 indexed id,
        address donationCollector,
        address token,
        uint256 amount,
        address tokenLocker
    );

    function campaigns(
        bytes16
    )
        external
        view
        returns (
            address manager,
            address token,
            uint256 amount,
            uint256 end,
            uint8 tokenLockup,
            bytes32 root
        );

    function cancelCampaign(bytes16 campaignId) external;

    function changeDonationcollector(address newCollector) external;

    function claimLockups(
        bytes16
    )
        external
        view
        returns (
            address tokenLocker,
            uint256 start,
            uint256 cliff,
            uint256 period,
            uint256 periods
        );

    function claimTokens(
        bytes16 campaignId,
        bytes32[] memory proof,
        uint256 claimAmount
    ) external;

    function claimed(bytes16, address) external view returns (bool);

    function createLockedCampaign(
        bytes16 id,
        ClaimCampaigns.Campaign memory campaign,
        ClaimCampaigns.ClaimLockup memory claimLockup,
        ClaimCampaigns.Donation memory donation
    ) external;

    function createUnlockedCampaign(
        bytes16 id,
        ClaimCampaigns.Campaign memory campaign,
        ClaimCampaigns.Donation memory donation
    ) external;

    function usedIds(bytes16) external view returns (bool);

    function verify(
        bytes32 root,
        bytes32[] memory proof,
        address claimer,
        uint256 amount
    ) external pure returns (bool);
}
