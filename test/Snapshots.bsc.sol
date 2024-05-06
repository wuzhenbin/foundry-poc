// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";

// token
WBNB constant BNB = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IERC20 constant USDT = IERC20(0x55d398326f99059fF775485246999027B3197955);
IERC20 constant BUSD = IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
IERC20 constant USDC = IERC20(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d);

// pancakeswap v2
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakeFactoryV2 constant PancakeFactoryV2 = IPancakeFactoryV2(
    0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73
);
IPancakePairV2 constant USDT_BNB_V2_Pool = IPancakePairV2(
    0x16b9a82891338f9bA80E2D6970FddA79D1eb0daE
);
// pancakeswap v3
address constant PANCAKE_V3_FACTORY = 0x0BFbCF9fa4f9C56B0F40a671Ad40E0805A091865;
bytes32 constant PancakeV3_POOL_INIT_CODE_HASH = 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2;

contract MockTest is Test {
    function token2token(
        address token1,
        address token2,
        uint256 amount
    ) internal {
        address[] memory path = new address[](2);
        path[0] = address(token1);
        path[1] = address(token2);

        PancakeV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }
}
