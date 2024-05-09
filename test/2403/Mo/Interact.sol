// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";
import "@interface/IWBNB.sol";
import "@interface/IUniswapV2.sol";

import "./IMo.sol";
import "./ILoan.sol";

IMo constant MO = IMo(0x61445Ca401051c86848ea6b1fAd79c5527116AA1);
address constant ApproveProxy = 0x9D8355a8D721E5c79589ac0aB49BC6d3e0eF7C3F;
IERC20 constant USDT = IERC20(0x94b008aA00579c1307B0EF2c499aD98a8ce58e58);
ILoan constant Loan = ILoan(0xAe7b6514Af26BcB2332FEA53B8Dd57bc13A7838E);
IUniswapV2Router constant UNISWAP_V2_ROUTER = IUniswapV2Router(
    0x9eADD135641f8b8cC4E060D33d63F8245f42bE59
);
IUniswapV2Pair constant MO_USDT_V2_Pool = IUniswapV2Pair(
    0x4a6E0fAd381d992f9eB9C037c8F78d788A9e8991
);

contract MoTest is Test {
    uint256 mo_balance;

    function setUp() public {
        vm.createSelectFork("optimism", 117395511);
        deal(address(MO), address(this), 62147724);

        vm.label(address(MO), "MO");
        vm.label(ApproveProxy, "ApproveProxy");
        vm.label(address(USDT), "USDT");
        vm.label(address(Loan), "Loan");
        vm.label(address(MO_USDT_V2_Pool), "MO_USDT_V2_Pool");
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testInteract() external {
        MO.approve(ApproveProxy, type(uint256).max);

        uint256 MoBalance = MO.balanceOf(address(this));
        Loan.borrow(MoBalance, 0);
        print("Mo balance", MO.balanceOf(address(this)), 4);
        print("USDT balance", USDT.balanceOf(address(this)), 6);

        Loan.redeem(0);
        print("USDT balance", USDT.balanceOf(address(this)), 6);

        // console.log(UniV2Pair.token0());
        // console.log(UniV2Pair.token1());
    }
}
