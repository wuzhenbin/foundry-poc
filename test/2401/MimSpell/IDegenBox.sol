// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IDegenBox {
    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function balanceOf(address, address) external view returns (uint256);

    function batch(
        bytes[] memory calls,
        bool revertOnFail
    )
        external
        payable
        returns (bool[] memory successes, bytes[] memory results);

    function batchFlashLoan(
        address borrower,
        address[] memory receivers,
        address[] memory tokens,
        uint256[] memory amounts,
        bytes memory data
    ) external;

    function claimOwnership() external;

    function deploy(
        address masterContract,
        bytes memory data,
        bool useCreate2
    ) external payable returns (address cloneAddress);

    function deposit(
        address token_,
        address from,
        address to,
        uint256 amount,
        uint256 share
    ) external payable returns (uint256 amountOut, uint256 shareOut);

    function flashLoan(
        address borrower,
        address receiver,
        address token,
        uint256 amount,
        bytes memory data
    ) external;

    function harvest(
        address token,
        bool balance,
        uint256 maxChangeAmount
    ) external;

    function masterContractApproved(
        address,
        address
    ) external view returns (bool);

    function masterContractOf(address) external view returns (address);

    function nonces(address) external view returns (uint256);

    function owner() external view returns (address);

    function pendingOwner() external view returns (address);

    function pendingStrategy(address) external view returns (address);

    function permitToken(
        address token,
        address from,
        address to,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function registerProtocol() external;

    function setMasterContractApproval(
        address user,
        address masterContract,
        bool approved,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function setStrategy(address token, address newStrategy) external;

    function setStrategyTargetPercentage(
        address token,
        uint64 targetPercentage_
    ) external;

    function strategy(address) external view returns (address);

    function strategyData(
        address
    )
        external
        view
        returns (
            uint64 strategyStartDate,
            uint64 targetPercentage,
            uint128 balance
        );

    function toAmount(
        address token,
        uint256 share,
        bool roundUp
    ) external view returns (uint256 amount);

    function toShare(
        address token,
        uint256 amount,
        bool roundUp
    ) external view returns (uint256 share);

    function totals(
        address
    ) external view returns (uint128 elastic, uint128 base);

    function transfer(
        address token,
        address from,
        address to,
        uint256 share
    ) external;

    function transferMultiple(
        address token,
        address from,
        address[] memory tos,
        uint256[] memory shares
    ) external;

    function transferOwnership(
        address newOwner,
        bool direct,
        bool renounce
    ) external;

    function whitelistMasterContract(
        address masterContract,
        bool approved
    ) external;

    function whitelistedMasterContracts(address) external view returns (bool);

    function withdraw(
        address token_,
        address from,
        address to,
        uint256 amount,
        uint256 share
    ) external returns (uint256 amountOut, uint256 shareOut);

    receive() external payable;
}
