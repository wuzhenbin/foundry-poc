// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IZ123 {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event MinterAdded(address indexed account);
    event MinterRemoved(address indexed account);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transactFeeValue(uint256) external view returns (uint256);

    function addMinter(address account) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function getContractorsFee(
        uint256 setType
    ) external view returns (uint256[] memory fee, address[] memory add);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isMinter(address account) external view returns (bool);

    function isWhite(address token) external view returns (uint256);

    function name() external view returns (string memory);

    function renounceMinter() external;

    function sale_date() external view returns (uint256);

    function setContractorsFee(
        uint256[] memory fee,
        address[] memory add,
        uint256 setType
    ) external;

    function setSaleDate(uint256 date) external;

    function setTransactFee(uint256[] memory fee) external;

    function setWhite(address[] memory users, uint256 value) external;

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function update(address pair, uint256 amount) external;
}
