// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IWBNB.sol";
import "@interface/IPancakeV3.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IERC20.sol";

IERC20 constant MARS = IERC20(0x436D3629888B50127EC4947D54Bb0aB1120962A0);
IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);

contract TokenReceiver {
    constructor() payable {
        MARS.approve(msg.sender, type(uint256).max);
    }
}

contract MarksTest is Test {
    IPancakePairV3 pairPool =
        IPancakePairV3(0x36696169C63e42cd08ce11f5deeBbCeBae652050);

    IERC20 USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);

    IPancakeRouterV2 pancakeRouterV2 =
        IPancakeRouterV2(payable(0x10ED43C718714eb63d5aA57B78B54704E256024E));

    IPancakePairV2 marsPair =
        IPancakePairV2(0x27A792d5DA0307fec5D0ada95268dA931baA1a06);

    function setUp() public {
        vm.createSelectFork("bsc", 37_903_300 - 1);
        deal(address(WBNB), address(this), 10 ether);
    }

    function testCantBuyMoreInAddress() public {
        WBNB.approve(address(pancakeRouterV2), type(uint256).max - 1);
        MARS.approve(address(pancakeRouterV2), type(uint256).max - 1);

        address[] memory path = new address[](2);
        path[0] = address(WBNB);
        path[1] = address(MARS);

        uint256 tobuy = pancakeRouterV2.getAmountsIn(1000 ether, path)[0];
        pancakeRouterV2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tobuy,
            0,
            path,
            address(this),
            block.timestamp + 1
        );

        tobuy = pancakeRouterV2.getAmountsIn(1000 ether, path)[0];

        // Tx cold down time overflow
        pancakeRouterV2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tobuy,
            0,
            path,
            address(this),
            block.timestamp + 1
        );
    }

    function testCanSellMore() public {
        WBNB.approve(address(pancakeRouterV2), type(uint256).max - 1);
        MARS.approve(address(pancakeRouterV2), type(uint256).max - 1);

        address[] memory path = new address[](2);
        path[0] = address(WBNB);
        path[1] = address(MARS);

        for (uint256 i = 0; i < 10; i++) {
            if (WBNB.balanceOf(address(this)) == 0) {
                break;
            }

            uint256 tobuy = pancakeRouterV2.getAmountsIn(1000 ether, path)[0];
            if (WBNB.balanceOf(address(this)) > tobuy) {
                _buyToken(path, tobuy);
            } else {
                _buyToken(path, WBNB.balanceOf(address(this)));
                break;
            }
        }

        path[0] = address(MARS);
        path[1] = address(WBNB);

        _saleToken(path, 1000 ether / 2);
        _saleToken(path, 1000 ether / 2);

        console.log(MARS.balanceOf(address(this)));
    }

    function testMarsTotalSupply() public {
        WBNB.approve(address(pancakeRouterV2), type(uint256).max - 1);
        MARS.approve(address(pancakeRouterV2), type(uint256).max - 1);

        uint256 start = MARS.totalSupply();

        address[] memory path = new address[](2);
        path[0] = address(WBNB);
        path[1] = address(MARS);
        uint256 tobuy = pancakeRouterV2.getAmountsIn(1000 ether, path)[0];
        _buyToken(path, tobuy);

        path[0] = address(MARS);
        path[1] = address(WBNB);
        uint256 mbal = MARS.balanceOf(address(this));
        _saleToken(path, mbal);

        emit log_named_decimal_uint("Burn", start - MARS.totalSupply(), 18);
    }

    function showPrice() public {
        (uint112 reserve0, uint112 reserve1, ) = marsPair.getReserves();
        uint256 price = reserve0 / reserve1;
        emit log_named_decimal_uint("Price", price, 18);
    }

    function _buyToken(address[] memory path, uint256 amount) internal {
        TokenReceiver receiver = new TokenReceiver();
        pancakeRouterV2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amount,
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
    }

    function _saleToken(address[] memory path, uint256 amount) internal {
        pancakeRouterV2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amount,
            0,
            path,
            address(this),
            block.timestamp + 1
        );
    }

    receive() external payable {}
}
