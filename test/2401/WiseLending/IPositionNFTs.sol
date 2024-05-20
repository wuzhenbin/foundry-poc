// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IPositionNFTs {
    function FEE_MANAGER_NFT() external view returns (uint256);

    function approve(address to, uint256 tokenId) external;

    function approveMint(address _spender, uint256 _nftId) external;

    function balanceOf(address owner) external view returns (uint256);

    function baseExtension() external view returns (string memory);

    function baseURI() external view returns (string memory);

    function claimOwnership() external;

    function feeManager() external view returns (address);

    function forwardFeeManagerNFT(address _feeManagerContract) external;

    function getApproved(uint256 tokenId) external view returns (address);

    function getApprovedSoft(uint256 tokenId) external view returns (address);

    function getNextExpectedId() external view returns (uint256);

    function isApprovedForAll(
        address owner,
        address operator
    ) external view returns (bool);

    function isOwner(
        uint256 _nftId,
        address _owner
    ) external view returns (bool);

    function master() external view returns (address);

    function mintPosition() external returns (uint256);

    function mintPositionForUser(address _user) external returns (uint256);

    function name() external view returns (string memory);

    function ownerOf(uint256 tokenId) external view returns (address);

    function proposeOwner(address _proposedOwner) external;

    function renounceOwnership() external;

    function reservePosition() external returns (uint256);

    function reservePositionForUser(address _user) external returns (uint256);

    function reserved(address) external view returns (uint256);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setBaseExtension(string memory _newBaseExtension) external;

    function setBaseURI(string memory _newBaseURI) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function tokenByIndex(uint256 index) external view returns (uint256);

    function tokenOfOwnerByIndex(
        address owner,
        uint256 index
    ) external view returns (uint256);

    function tokenURI(uint256 _tokenId) external view returns (string memory);

    function totalReserved() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transferFrom(address from, address to, uint256 tokenId) external;

    function walletOfOwner(
        address _owner
    ) external view returns (uint256[] memory);
}
