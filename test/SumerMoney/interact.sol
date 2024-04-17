// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IBalancer.sol";
import "@interface/IWETH9.sol";
import "@interface/IERC20.sol";
import "@interface/ICbETH.sol";
import "@interface/ISumerMoney.sol";

WETH9 constant WETH = WETH9(0x4200000000000000000000000000000000000006);
IERC20 constant USDC = IERC20(0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913);

ICEther constant sdrETH = ICEther(
    payable(0x7b5969bB51fa3B002579D7ee41A454AC691716DC)
);

ICErc20 constant sdrUSDC = ICErc20(0x142017b52c99d3dFe55E49d79Df0bAF7F4478c0c);
ICErc20 constant sdrcbETH = ICErc20(0x6345aF6dA3EBd9DF468e37B473128Fd3079C4a4b);

ICbETH constant cbETH = ICbETH(0x2Ae3F1Ec7F1F5012CFEab0185bfc7aa3cf0DEc22);

IBalancerVault constant vault = IBalancerVault(
    0xBA12222222228d8Ba445958a75a0704d566BF2C8
);

ITimelock constant timelock = ITimelock(
    payable(0x549D0CdC753601fbE29f9DE186868429a8558E07)
);

contract SumerMoneyInteract is Test {
    function setUp() public {
        vm.createSelectFork("base", 13_076_768);

        deal(address(this), 150 ether);
        deal(address(USDC), address(this), 645000 * 1e6);
    }

    function testSomeThing() public {
        sdrETH.mint{value: 150 ether}();

        sdrUSDC.borrow(1000 * 1e6);

        console.log(sdrETH.balanceOf(address(this)));
    }

    receive() external payable {}
}
