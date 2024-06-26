// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWETH9.sol";
import "@interface/IUniswapV2.sol";
import "@interface/IUniswapV3.sol";

// token
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IERC20 constant WBTC = IERC20(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
IERC20 constant DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);

//  uniswap
IUniswapV2Factory constant UNISWAP_V2_FACTORY = IUniswapV2Factory(
    0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
);
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
);
IUniswapV3Pool constant Pool = IUniswapV3Pool(
    0x36696169C63e42cd08ce11f5deeBbCeBae652050
);
IUniswapV3Router constant UniV3Router = IUniswapV3Router(
    payable(0xE592427A0AEce92De3Edee1F18E0157C05861564)
);
bytes32 constant UniswapV3_POOL_INIT_CODE_HASH = 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54;

contract MockTest is Test {
    function token2token(
        address token1,
        address token2,
        uint256 amount
    ) internal {
        address[] memory path = new address[](2);
        path[0] = address(token1);
        path[1] = address(token2);

        UNISWAP_V2_ROUTER.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                amount,
                0,
                path,
                address(this),
                block.timestamp
            );
    }
}
