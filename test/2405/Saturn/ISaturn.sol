// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!
pragma solidity ^0.8.4;

interface ISaturn {
    error ErrUnableSwap();
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event AutoBuildLP();
    event AutoInflateLP();
    event AutoNukeLP();
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event ProcessBlockOverflow(uint256 indexed _number, uint256 indexed _lpb);
    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function aDay() external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function automatedMarketMakerPairs(address) external view returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function blockBurnLpOfRate() external view returns (uint256);

    function blockBurnSwitch(uint256) external view returns (uint256);

    function blockCalcAmount() external view returns (uint256);

    function blockDisableBurn(uint256) external view returns (uint256);

    function burn(uint256 amount) external;

    function burnFrom(address account, uint256 amount) external;

    function burnRate() external view returns (uint256);

    function buyFee() external view returns (uint256);

    function commonDiv() external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function dexPrice(uint256 _amount) external view returns (uint256);

    function dividendAddress() external view returns (address);

    function enableSwitch() external view returns (bool);

    function enableTrade() external view returns (bool);

    function everyTimeBuyLimitAmount() external view returns (uint256);

    function everyTimeSellLimitAmount() external view returns (uint256);

    function excludedFromFees(address account, bool excluded) external;

    function getDay() external view returns (uint256);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function initialPool() external view returns (bool);

    function initialPrice() external view returns (uint256);

    function isExcludedFromFees(address account) external view returns (bool);

    function isMintable() external view returns (bool);

    function lockMintTime() external view returns (uint256);

    function lockTxTime() external view returns (uint256);

    function marketAddress() external view returns (address);

    function maxMintPrice() external view returns (uint256);

    function maxTxAmount() external view returns (uint256);

    function mintBonusRate() external view returns (uint256);

    function mintFee1() external view returns (uint256);

    function mintFee2() external view returns (uint256);

    function mintLocks(
        address
    ) external view returns (uint256 num, uint256 time);

    function mintPredictTokenNum(
        uint256 _bnbAmt
    ) external view returns (uint256 _tokenAmt);

    function mintPrice() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function pairTokenAmt(
        uint256 _bnbAmt
    ) external view returns (uint256 _convertTokenBal);

    function renounceOwnership() external;

    function sellFee() external view returns (uint256);

    function setAutomatedMarketMakerPair(address pair, bool value) external;

    function setAvaliableTransfer(bool _open) external;

    function setBlockBurnLpOfRate(uint256 _amount) external;

    function setBlockCalcAmount(uint256 _amount) external;

    function setBurnRate(uint256 _rate) external;

    function setCommonDiv(uint256 _commonDiv) external;

    function setDividend(address _addr, address _dividend) external;

    function setEnableSwitch(bool _flag) external;

    function setEveryTimeTxLimitAmount(uint256 _buy, uint256 _sell) external;

    function setFee(uint256 _sf, uint256 _bf) external;

    function setLockMintTime(uint256 _time, uint256 _time2) external;

    function setMaxTxAmount(uint256 _amount) external;

    function setMintFee(uint256 _f1, uint256 _f2) external;

    function setPerMintPrice(
        uint256 _price,
        uint256 _maxMint,
        uint256 _mintBonusRate
    ) external;

    function startTime() external view returns (uint256);

    function swapIng() external view returns (bool);

    function symbol() external view returns (string memory);

    function tokenReciever() external view returns (address);

    function totalDestroy() external view returns (uint256);

    function totalMintAmount() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function uniswapV2Pair() external view returns (address);

    function uniswapV2Router() external view returns (address);

    receive() external payable;
}
