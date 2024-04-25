// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";

contract AbiDecode {
    function encode(
        address from,
        address to,
        uint256 value
    ) external pure returns (bytes memory) {
        return abi.encode(from, to, value);
    }

    function decode(
        bytes calldata data
    ) external pure returns (address from, address to, uint256 value) {
        (from, to, value) = abi.decode(data, (address, address, uint256));
    }
}

contract MockTest is Test {
    AbiDecode abiDecode;

    function setUp() public {
        abiDecode = new AbiDecode();
    }

    function testDecode() public view {
        // bytes memory encode = testDecode.encode(BUSDT, address(this), 1);
        // console.logBytes(encode);

        // (address from, address to, uint256 value) = testDecode.decode(
        //     hex"00000000000000000000000055d398326f99059ff775485246999027b31979550000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e14960000000000000000000000000000000000000000000000000000000000000001"
        // );

        // remeber remove the selector bytes
        (
            address value1,
            address value2,
            uint256 value3,
            uint256 value4,
            uint256[] memory value5
        ) = abi.decode(
                hex"000000000000000000000000322696471792440499b1979e0a440491e870667a00000000000000000000000055d398326f99059ff775485246999027b319795500000000000000000000000000000000000000000000001ded5eeca66b6e7906000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000140000000000000003b74a46016b9a82891338f9ba80e2d6970fdda79d1eb0dae",
                (address, address, uint256, uint256, uint256[])
            );

        console.log(value1);
        console.log(value2);
        console.log(value3);
        console.log(value4);
        for (uint256 i = 0; i < value5.length; i++) {
            console.log(value5[i], "***");
        }
    }
}
