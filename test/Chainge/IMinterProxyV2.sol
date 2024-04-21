// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IMinterProxyV2 {
    event ControllerAdded(address controller);
    event ControllerRemoved(address controller);
    event LogVaultCall(
        address indexed target,
        uint256 amount,
        bool success,
        bytes reason
    );
    event LogVaultIn(
        address indexed token,
        uint256 indexed orderID,
        address indexed receiver,
        uint256 amount,
        uint256 serviceFee,
        uint256 gasFee
    );
    event LogVaultOut(
        address indexed token,
        address indexed from,
        uint256 indexed orderID,
        uint256 amount,
        address vault,
        bytes order
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Paused(address account);
    event Unpaused(address account);

    fallback() external payable;

    function NATIVE() external view returns (address);

    function _liquidpool() external view returns (address);

    function _orderID() external view returns (uint256);

    function addController(address _controller) external;

    function bytesEqual(
        bytes memory a,
        bytes memory b
    ) external pure returns (bool);

    function call(address target, bytes memory _data) external payable;

    function chainID() external view returns (uint256);

    function completedOrder(uint256) external view returns (bool);

    function controllerCnt() external view returns (uint8);

    function isController(address _controller) external view returns (bool);

    function isMinter(address _contract) external view returns (bool);

    function isMinterWithData(
        address _contract,
        bytes memory data,
        bytes memory expectRes
    ) external view returns (bool);

    function isUUIDCompleted(uint256 uuid) external view returns (bool);

    function mintTo(
        address tokenAddr,
        address receiver,
        uint256 amount
    ) external;

    function owner() external view returns (address);

    function pause() external;

    function removeController(address _controller) external;

    function setLiquidpool(address _lp) external;

    function setWrapNative(address _wNative) external;

    function swap(
        address tokenAddr,
        uint256 amount,
        address target,
        address receiveToken,
        address receiver,
        uint256 minAmount,
        bytes memory callData,
        bytes memory order
    ) external payable;

    function transferOwnership(address newOwner) external;

    function unpause() external;

    function vaultIn(
        uint256 orderID,
        address receiveToken,
        address receiver,
        bool burnable,
        uint256 amount
    ) external;

    function vaultInAndCall(
        uint256 orderID,
        address tokenAddr,
        address toAddr,
        bool burnable,
        uint256 amount,
        address receiver,
        address receiveToken,
        uint256[] memory fees,
        bytes memory data
    ) external;

    function vaultOut(
        address tokenAddr,
        uint256 amount,
        bool burnable,
        bytes memory order
    ) external payable;

    function wNATIVE() external view returns (address);

    function withdrawFee(
        address token,
        address receiver,
        uint256 amount
    ) external;

    receive() external payable;
}
