// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IBalancer.sol";
import "@interface/IERC20.sol";

import "./IPriceFeed.sol";
import "./IMkUSDLoan.sol";
import "./IBorrowerOperations.sol";

/*  
00000000000000000000000056a201b872b50bbdee0021ed4d1bb36359d291ed0000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000000000000000000000000000000011c3794b4c52ff0000000000000000000000000000000000000000000000191bf9b8cefc50317e000000000000000000000000e87c6f39881d5bf51cf46d3dc7e1c1731c2f790a00000000000000000000000089ee26fcdff6b109f81abc6876600ec427f7907f

000000000000000000000000d996073019c74b2fb94ead236e32032405bc027c0000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000000000000000000000000000000011c3794b4c52ff0000000000000000000000000000000000000000000000458a6330674daf1a93000000000000000000000000e87c6f39881d5bf51cf46d3dc7e1c1731c2f790a00000000000000000000000089ee26fcdff6b109f81abc6876600ec427f7907f
*/

contract PrismaFiTest is Test {
    IBalancerVault constant vault =
        IBalancerVault(0xBA12222222228d8Ba445958a75a0704d566BF2C8);
    IPriceFeed constant priceFeed =
        IPriceFeed(0xC105CeAcAeD23cad3E9607666FEF0b773BC86aac);

    IMkUSDLoan constant mkUSD =
        IMkUSDLoan(0x4591DBfF62656E7859Afe5e45f6f47D3669fBB28);

    IERC20 constant wstETH = IERC20(0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0);

    IBorrowerOperations constant borrowerOperations =
        IBorrowerOperations(0x72c590349535AD52e6953744cb2A36B409542719);

    address constant MigrateTroveZap =
        0xcC7218100da61441905e0c327749972e3CBee9EE;

    function setUp() public {
        vm.createSelectFork("mainnet", 19532297 - 1);

        deal(address(mkUSD), address(this), 1.800000022022732637 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testMock() public view {
        decode(
            hex"000000000000000000000000d996073019c74b2fb94ead236e32032405bc027c0000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000000000000000000000000000000011c3794b4c52ff0000000000000000000000000000000000000000000000458a6330674daf1a93000000000000000000000000e87c6f39881d5bf51cf46d3dc7e1c1731c2f790a00000000000000000000000089ee26fcdff6b109f81abc6876600ec427f7907f"
        );
        decode(
            hex"00000000000000000000000056a201b872b50bbdee0021ed4d1bb36359d291ed0000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000001cc79f3f47bfc060b6f761fcd1afc6d399a968b60000000000000000000000000000000000000000000000000011c3794b4c52ff0000000000000000000000000000000000000000000000191bf9b8cefc50317e000000000000000000000000e87c6f39881d5bf51cf46d3dc7e1c1731c2f790a00000000000000000000000089ee26fcdff6b109f81abc6876600ec427f7907f"
        );
    }

    function decode(bytes memory data) internal view {
        (
            address account,
            address troveManagerFrom,
            address troveManagerTo,
            uint256 maxFeePercentage,
            uint256 coll,
            address upperHint,
            address lowerHint
        ) = abi.decode(
                data,
                (address, address, address, uint256, uint256, address, address)
            );
        console.log("account", account);
        console.log("troveManagerFrom", troveManagerFrom);
        console.log("troveManagerTo", troveManagerTo);
        console.log("maxFeePercentage", maxFeePercentage);
        console.log("coll", coll);
        console.log("upperHint", upperHint);
        console.log("lowerHint", lowerHint);
        console.log("------------");
    }
}
