// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";

import "./IMinterProxyV2.sol";

IMinterProxyV2 constant minterProxy = IMinterProxyV2(
    payable(0x80a0D7A6FD2A22982Ce282933b384568E5c852bF)
);

address constant BUSDT = 0x55d398326f99059fF775485246999027B3197955;
address constant BabyDoge = 0xc748673057861a797275CD8A068AbB95A902e8de;
address constant SolToken = 0x570A5D26f7765Ecb712C0924E4De545B89fD43dF;
address constant AvaxToken = 0x1CE0c2827e2eF14D5C4f29a091d735A204794041;
address constant FLOKI = 0xfb5B838b6cfEEdC2873aB27866079AC55363D37E;
address constant ATOM = 0x0Eb3a705fc54725037CC9e008bDede697f62F335;
address constant TLOS = 0xb6C53431608E626AC81a9776ac3e999c5556717c;
address constant IOTX = 0x9678E42ceBEb63F23197D726B29b1CB20d0064E5;
address constant OneInch = 0x111111111117dC0aa78b770fA6A738034120C302;

contract AbiDecode {
    struct MyStruct {
        string name;
        uint[2] nums;
    }

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

contract ChaingeTest is Test {
    AbiDecode testDecode;

    function setUp() public {
        // vm.createSelectFork("bsc");
        testDecode = new AbiDecode();
    }

    function testFunction() public view {
        // bytes memory encode = testDecode.encode(BUSDT, address(this), 1);
        // console.logBytes(encode);

        // (address from, address to, uint256 value) = testDecode.decode(
        //     hex"00000000000000000000000055d398326f99059ff775485246999027b31979550000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e14960000000000000000000000000000000000000000000000000000000000000001"
        // );

        // remeber remove the selector bytes
        (address from, address to, uint256 value) = abi.decode(
            hex"0000000000000000000000008a4aa176007196d48d39c89402d3753c39ae64c100000000000000000000000069795d09aa99a305b4fc2ed158d4944bcd91d59a00000000000000000000000000000000000000000000045ba77ac89bb21682b4",
            (address, address, uint256)
        );

        console.log(from);
        console.log(to);
        console.log(value);
    }
}
