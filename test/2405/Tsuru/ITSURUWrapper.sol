// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ITSURUWrapper {
    error ERC20InsufficientAllowance(
        address spender,
        uint256 allowance,
        uint256 needed
    );
    error ERC20InsufficientBalance(
        address sender,
        uint256 balance,
        uint256 needed
    );
    error ERC20InvalidApprover(address approver);
    error ERC20InvalidReceiver(address receiver);
    error ERC20InvalidSender(address sender);
    error ERC20InvalidSpender(address spender);
    error OwnableInvalidOwner(address owner);
    error OwnableUnauthorizedAccount(address account);
    error ReentrancyGuardReentrantCall();
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function _maxTotalSupply() external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function close() external;

    function decimals() external view returns (uint8);

    function erc1155Contract() external view returns (address);

    function erc721Contract() external view returns (address);

    function holders() external view returns (uint256);

    function maxTotalSupply() external view returns (uint256);

    function name() external view returns (string memory);

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) external pure returns (bytes4);

    function onERC1155Received(
        address,
        address from,
        uint256 id,
        uint256 amount,
        bytes memory
    ) external returns (bytes4);

    function onERC721Received(
        address,
        address from,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function open() external;

    function opened() external view returns (bool);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function tokenID() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function unwrap(uint256 erc20Amount) external;
}
