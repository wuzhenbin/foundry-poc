// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IGAIN {
    function DECIMALS() external view returns (uint256);

    function Gainos_Snaps() external;

    function MAX_UINT256() external view returns (uint256);

    function _autoAddLiquidity() external view returns (bool);

    function _autoSnap() external view returns (bool);

    function _children_of_gainos(address) external view returns (string memory);

    function _decimals() external view returns (uint8);

    function _lastAddLiquidityTime() external view returns (uint256);

    function _lastSnappedTime() external view returns (uint256);

    function _maxTxAmount() external view returns (uint256);

    function _maxWalletSize() external view returns (uint256);

    function _name() external view returns (string memory);

    function _rejoice() external view returns (bool);

    function _sideA() external view returns (uint256);

    function _sideB() external view returns (uint256);

    function _symbol() external view returns (string memory);

    function _totalSupply() external view returns (uint256);

    function allowance(
        address owner_,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function autoLiquidityReceiver() external view returns (address);

    function balanceOf(address who) external view returns (uint256);

    function blacklist(address) external view returns (bool);

    function blockBots(address[] memory bots_) external;

    function checkFeeExempt(address _addr) external view returns (bool);

    function codeRequiredToBuy() external view returns (bool);

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function endStartTime(bool _end) external;

    function feeDenominator() external view returns (uint256);

    function gainosInsuranceFund() external view returns (uint256);

    function gainosInsuranceFundReceiver() external view returns (address);

    function getCirculatingSupply() external view returns (uint256);

    function getCodeFromDapp(address account, uint256 _constant) external;

    function getDivineWisdom(
        address who
    ) external view returns (uint256 balance, string memory sideGiven);

    function getLiquidityBacking(
        uint256 accuracy
    ) external view returns (uint256);

    function getUniversalSalvation(
        address who
    ) external view returns (string memory sideGiven);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isOwner() external view returns (bool);

    function lastSideChosen() external view returns (string memory);

    function liquidityFee() external view returns (uint256);

    function manualSync() external;

    function name() external view returns (string memory);

    function nextSnap() external view returns (uint256);

    function owner() external view returns (address);

    function pair() external view returns (address);

    function pairAddress() external view returns (address);

    function pairContract() external view returns (address);

    function registered(address) external view returns (uint256);

    function renounceOwnership() external;

    function rewardYield() external view returns (uint256);

    function rewardYieldDenominator() external view returns (uint256);

    function router() external view returns (address);

    function sellFee() external view returns (uint256);

    function setAutoAddLiquidity(bool _flag) external;

    function setAutoSnap(bool _flag) external;

    function setBotBlacklist(address _botAddress, bool _flag) external;

    function setMaxTxnAmount(uint256 maxTxAmount) external;

    function setMaxWalletSize(uint256 maxWalletSize) external;

    function setNextSnap(uint256 _nextSnap) external;

    function setPairAddress(address _pairAddress) external;

    function setPairContract(address _address) external;

    function setRewardYield(
        uint256 _rewardYield,
        uint256 _rewardYieldDenominator
    ) external;

    function setSideNames(
        string memory _sideAName,
        string memory _sideBName
    ) external;

    function setSnapFrequency(uint256 _snapFrequency) external;

    function setTrading(bool _tradingOpen) external;

    function setWhitelist(address _addr) external;

    function sideA() external view returns (string memory);

    function sideB() external view returns (string memory);

    function snapCounter() external view returns (uint256);

    function snapFrequency() external view returns (uint256);

    function soulGraveyard() external view returns (address);

    function soulGraveyardFee() external view returns (uint256);

    function startTimeOver() external view returns (bool);

    function symbol() external view returns (string memory);

    function totalFee() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function tradingOpen() external view returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function treasuryFee() external view returns (uint256);

    function treasuryReceiver() external view returns (address);

    function unblockBot(address notbot) external;

    receive() external payable;
}
