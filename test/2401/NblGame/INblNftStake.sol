// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface INblNftStake {
    function aheadDiscounts(
        uint256
    ) external view returns (uint256 amount, uint256 times);

    function calcAllSlotPowerFor(address user) external view returns (uint256);

    function calcDiscount(
        uint256 begin,
        uint256 amount
    ) external view returns (uint256);

    function community() external view returns (address);

    function depositInscription(
        uint256 _inscriptionId,
        uint256 _index
    ) external;

    function depositNbl(uint256 _index, uint256 _amount) external;

    function depositNft(uint256 _tokenid, uint256 _index) external;

    function emergencyWithdraw() external;

    function getAvailabeSlots(address user) external view returns (uint256);

    function getInscriptionPower(
        uint256 _tokenid
    ) external view returns (uint256);

    function getNblPower(uint256 amount) external view returns (uint256);

    function getNftPower(uint256 _tokenid) external view returns (uint256);

    function getSlotPower(
        address user,
        uint256 index
    ) external view returns (uint256);

    function harvest() external;

    function inscription() external view returns (address);

    function inscriptionQualityHp(
        uint256,
        uint256
    ) external view returns (uint256);

    function nbl() external view returns (address);

    function nblPowerMultiplies(
        uint256
    ) external view returns (uint256 amount, uint256 times);

    function nft() external view returns (address);

    function nftGradeHp(uint256) external view returns (uint256);

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function owner() external view returns (address);

    function pendingAwards(address _user) external view returns (uint256);

    function powerOf(address _user) external view returns (uint256);

    function putDeps(address _inscription, address _stakebook) external;

    function putSetting(
        address _vault,
        address _community,
        address utoken,
        uint256[] memory sprices
    ) external;

    function renounceOwnership() external;

    function setAheadDiscounts(
        uint256[] memory periods,
        uint256[] memory discounts
    ) external;

    function setHarvestPeroid(uint256 value) external;

    function setInscriptionHashpowers(
        uint256[] memory star1_powers,
        uint256[] memory star2_powers,
        uint256[] memory star3_powers
    ) external;

    function setNblPowerMultiplies(
        uint256[] memory nbls,
        uint256[] memory multiplies
    ) external;

    function setNftHashpowers(uint256[] memory powers) external;

    function setSlotPowerMultiplies(uint256[] memory powers) external;

    function slotPowerMultiplies(uint256) external view returns (uint256);

    function slotprices(uint256) external view returns (uint256);

    function totalAmount() external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function unlockSlot() external;

    function usdToken() external view returns (address);

    function userLastHarvestTime(address) external view returns (uint256);

    function userStakeInfo(
        address,
        uint256
    )
        external
        view
        returns (
            uint256 nftTokenId,
            uint256 inscriptionId,
            uint256 nblStakeAmount,
            uint256 begin
        );

    function userStakeNfts(address user) external view returns (uint256);

    function vault() external view returns (address);

    function withdrawNft(uint256 _index) external;
}
