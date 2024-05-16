// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IMiner {
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(
        address account,
        uint256 id
    ) external view returns (uint256);

    function balanceOf(
        address owner,
        uint256 start,
        uint256 stop
    ) external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfBatch(
        address[] memory accounts,
        uint256[] memory ids
    ) external view returns (uint256[] memory);

    function baseTokenURI() external view returns (string memory);

    function dataURI() external view returns (string memory);

    function decimalFactor() external view returns (uint256);

    function decimals() external view returns (uint8);

    function easyLaunch() external view returns (uint256);

    function getApproved(uint256) external view returns (address);

    function isApprovedForAll(
        address account,
        address operator
    ) external view returns (bool);

    function isOwnerOf(
        address account,
        uint256 id
    ) external view returns (bool);

    function maxWallet() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setDataURI(string memory _dataURI) external;

    function setMaxWallet(uint256 percent) external;

    function setTokenURI(string memory _tokenURI) external;

    function setURI(string memory newuri) external;

    function setWhitelist(address target, bool state) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function toggleDelay() external;

    function tokenURI(uint256 id) external view returns (string memory);

    function tokensOfOwner(
        address owner
    ) external view returns (uint256[] memory);

    function tokensOfOwnerIn(
        address owner,
        uint256 start,
        uint256 stop
    ) external view returns (uint256[] memory);

    function tokensPerNFT() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferDelay() external view returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function uri(uint256 id) external view returns (string memory);

    function whitelist(address) external view returns (bool);
}
