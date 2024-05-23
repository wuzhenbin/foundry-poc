// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "./ECDSA.sol";

import "forge-std/Test.sol";

abstract contract EIP712 {
    bytes32 public _CACHED_DOMAIN_SEPARATOR;
    uint256 public _CACHED_CHAIN_ID;

    bytes32 public _HASHED_NAME;
    bytes32 public _HASHED_VERSION;
    bytes32 public _TYPE_HASH;

    constructor(string memory name, string memory version) {
        bytes32 hashedName = keccak256(bytes(name));
        bytes32 hashedVersion = keccak256(bytes(version));
        bytes32 typeHash = keccak256(
            "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
        );
        _HASHED_NAME = hashedName;
        _HASHED_VERSION = hashedVersion;
        _CACHED_CHAIN_ID = block.chainid;
        _CACHED_DOMAIN_SEPARATOR = _buildDomainSeparator(
            typeHash,
            hashedName,
            hashedVersion
        );
        _TYPE_HASH = typeHash;
    }

    function _domainSeparatorV4() public view returns (bytes32) {
        if (block.chainid == _CACHED_CHAIN_ID) {
            return _CACHED_DOMAIN_SEPARATOR;
        } else {
            return
                _buildDomainSeparator(
                    _TYPE_HASH,
                    _HASHED_NAME,
                    _HASHED_VERSION
                );
        }
    }

    function _buildDomainSeparator(
        bytes32 typeHash,
        bytes32 nameHash,
        bytes32 versionHash
    ) public view returns (bytes32) {
        return
            keccak256(
                abi.encode(
                    typeHash,
                    nameHash,
                    versionHash,
                    block.chainid,
                    // address(this)
                    0xc82BbE41f2cF04e3a8efA18F7032BDD7f6d98a81 // change this line
                )
            );
    }

    function _hashTypedDataV4(
        bytes32 structHash
    ) public view virtual returns (bytes32) {
        return ECDSA.toTypedDataHash(_domainSeparatorV4(), structHash);
    }
}
