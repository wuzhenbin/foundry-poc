// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IWBNB.sol";
import "@interface/IUniswapV3.sol";
import "@interface/IERC20.sol";

import "./ISwapRouter.sol";
import "./IPresaleBSCV5.sol";

contract WsmTest is Test {
    IUniswapV3Pool WSM_BNB_Pool =
        IUniswapV3Pool(0x84F3cA9B7a1579fF74059Bd0e8929424D3FA330E);
    IERC20 WSM = IERC20(0x62694D43Ccb9B64e76e38385d15e325c7712A735);
    WBNB BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
    SwapRouter swapRouter =
        SwapRouter(payable(0x74Dca1Bd946b9472B2369E11bC0E5603126E4C18));
    IPresaleBSCV5 presaleBSCV5 =
        IPresaleBSCV5(0xFB071837728455c581f370704b225ac9eABDfa4a);

    function setUp() public {
        vm.createSelectFork("bsc", 37569861 - 1);
        deal(address(this), 0);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public view {}

    receive() external payable {}
}
