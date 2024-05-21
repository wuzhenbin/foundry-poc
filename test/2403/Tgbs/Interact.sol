// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IPancakeV2.sol";
import "@interface/IDodo.sol";

IWBNB constant WBNB = IWBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
IDODO constant dodoPool = IDODO(0x05d968B7101701b6AD5a69D45323746E9a791eB5);

ITGBS constant TGBS = ITGBS(0xedecfA18CAE067b2489A2287784a543069f950F4);
IPancakeRouterV2 constant PancakeV2Router = IPancakeRouterV2(
    payable(0x10ED43C718714eb63d5aA57B78B54704E256024E)
);
IPancakePairV2 constant WBNB_TGBS_Pool = IPancakePairV2(
    payable(0x779a0E4799488d2fCAc65f5fb8Eb65dBbF08cE43)
);

interface ITGBS is IERC20 {
    function _burnBlock() external view returns (uint256);
}

contract TgbsTest is Test {
    function setUp() public {
        vm.createSelectFork("bsc", 36725819);
        vm.label(address(dodoPool), "dodoPool");
        vm.label(address(WBNB), "WBNB");
        vm.label(address(TGBS), "TGBS");
        vm.label(address(PancakeV2Router), "PancakeV2Router");

        deal(address(WBNB), address(this), 1300 ether);
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        WBNB.approve(address(PancakeV2Router), type(uint256).max - 1);
        TGBS.approve(address(PancakeV2Router), type(uint256).max - 1);

        // token2token(address(BNB), address(TGBS), 1300 ether);
        // print("TGBS balance", TGBS.balanceOf(address(this)), 18);

        // uint256 burnBlock = TGBS._burnBlock();
        // console.log(burnBlock);
        // console.log(block.number);

        uint256 poolAmount = TGBS.balanceOf(address(WBNB_TGBS_Pool));
        uint256 poolBNB = WBNB.balanceOf(address(WBNB_TGBS_Pool));
        print("poolAmount", poolAmount, 18);
        print("poolBNB", poolBNB, 18);
    }

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
