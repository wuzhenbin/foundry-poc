// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IPandoras {
    function _disableTransferBlock() external view returns (uint256);

    function _uniswapV3Pool() external view returns (address);

    function allowance(address, address) external view returns (uint256);

    function approve(
        address spender,
        uint256 amountOrId
    ) external returns (bool);

    function balanceOf(address) external view returns (uint256);

    function baseTokenURI() external view returns (string memory);

    function concatenate(
        string memory a,
        string memory b
    ) external pure returns (string memory);

    function dataURI() external view returns (string memory);

    function decimals() external view returns (uint8);

    function getApproved(uint256) external view returns (address);

    function initialBuyBlock(address) external view returns (uint256);

    function isApprovedForAll(address, address) external view returns (bool);

    function minted() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function ownerOf(uint256 id) external view returns (address owner);

    function revokeOwnership() external;

    function safeTransferFrom(address from, address to, uint256 id) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        bytes memory data
    ) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setDataURI(string memory _dataURI) external;

    function setNameSymbol(string memory _name, string memory _symbol) external;

    function setTokenURI(string memory _tokenURI) external;

    function setWhitelist(address target, bool state) external;

    function symbol() external view returns (string memory);

    function tokenURI(uint256 id) external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amountOrId
    ) external;

    function transferOwnership(address _owner) external;

    function whitelist(address) external view returns (bool);
}
