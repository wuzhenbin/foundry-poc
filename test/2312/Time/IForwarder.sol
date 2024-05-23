// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IForwarder {
    function execute(
        Forwarder.ForwardRequest memory req,
        bytes memory signature
    ) external payable returns (bool, bytes memory);

    function getNonce(address from) external view returns (uint256);

    function verify(
        Forwarder.ForwardRequest memory req,
        bytes memory signature
    ) external view returns (bool);
}

interface Forwarder {
    struct ForwardRequest {
        address from;
        address to;
        uint256 value;
        uint256 gas;
        uint256 nonce;
        bytes data;
    }
}
