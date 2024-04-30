// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ISquidTokenSwap {
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error OwnableInvalidOwner(address owner);
    error OwnableUnauthorizedAccount(address account);
    error ReentrancyGuardReentrantCall();
    error SafeERC20FailedOperation(address token);
    event Blacklisted(address indexed user);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Swap(address indexed user, uint256 oldAmount, uint256 totalSwapped);
    event TokensRescued(address token, uint256 amount);
    event Unblacklisted(address indexed user);

    function ALTERNATIVE_SELL_AMOUNT() external view returns (uint256);

    function DEFAULT_SELL_AMOUNT() external view returns (uint256);

    function addToBlacklist(address user) external;

    function blacklist(address) external view returns (bool);

    function deploymentTime() external view returns (uint256);

    function enableSwap() external;

    function getMinOut(uint256 sellAmount) external view returns (uint256);

    function newSquidToken() external view returns (address);

    function oldSquidToken() external view returns (address);

    function owner() external view returns (address);

    function pancakeRouter() external view returns (address);

    function removeFromBlacklist(address user) external;

    function renounceOwnership() external;

    function rescueTokens(address tokenAddress, uint256 amount) external;

    function sellSwappedTokens(uint256 sellOption) external;

    function swapEnabled() external view returns (bool);

    function swapTokens(uint256 amount) external;

    function totalSwapped() external view returns (uint256);

    function totalSwappedToSell() external view returns (uint256);

    function transferOwnership(address newOwner) external;
}
