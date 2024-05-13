// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";

import "./IApolloXBscVault.sol";
import "./IStableCoinVault.sol";

interface Vun {
    function _swap(address tokenForSwap, bytes memory agg) external;
}

IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IApolloXBscVault constant ALP_APO = IApolloXBscVault(
    0x9Ad45D46e2A2ca19BBB5D5a50Df319225aD60e0d
);
IStableCoinVault constant StableCoinVault = IStableCoinVault(
    payable(0xD188492217F09D18f2B0ecE3F8948015981e961a)
);

contract ContractTest is Test {
    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function setUp() external {
        // vm.createSelectFork("bsc", 36727073);
        // deal(address(USDT), address(this), 0);
    }

    function testExploit() external view {
        // bytes memory encode = testDecode.encode(USDT, address(this), 1);
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
                hex"0000000000000000000000000edf13f6bd033f0f267d46c6e9dff9c7190e0fa00000000000000000000000009ad45d46e2a2ca19bbb5d5a50df319225ad60e0d0000000000000000000000000000000000000000000001d74242867c6f54446e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000100000000000000003b74a4600edf13f6bd033f0f267d46c6e9dff9c7190e0fa0",
                (address, address, uint256, uint256, uint256[])
            );

        console.log(value1);
        console.log(value2);
        console.log(value3);
        console.log(value4);
        for (uint256 i = 0; i < value5.length; i++) {
            console.log(value5[i], "***");
        }

        // 0x0eDf13F6BD033F0F267d46C6e9DFf9c7190e0FA0 attacker
        // 0x9Ad45D46e2A2ca19BBB5D5a50Df319225aD60e0d ApolloX-ALP
        // 8693190985141166818414 StableCoinVaultBalance
        // 0
        // 1457847883322476336973117616015931141981540430361545019296
    }
}
