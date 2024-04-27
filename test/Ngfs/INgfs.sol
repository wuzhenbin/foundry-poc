// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface INgfs {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event InitLiquidity(
        uint256 tokensAmount,
        uint256 trxAmount,
        uint256 liqudityAmount
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 trxReceived,
        uint256 tokensIntoLiqudity
    );
    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function DEAD() external view returns (address);

    function ZERO() external view returns (address);

    function _addLPFee() external view returns (uint256);

    function _buyFundFee() external view returns (uint256);

    function _removeLPFee() external view returns (uint256);

    function _sellFundFee() external view returns (uint256);

    function _transferFee() external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function batchBots() external view returns (uint256);

    function batchSetFeeWhiteList(
        address[] memory addres,
        bool enable
    ) external;

    function batchSetIllegalAdrList(
        address[] memory addres,
        bool enable
    ) external;

    function claimBalance() external;

    function claimToken(address token, uint256 amount, address to) external;

    function closeAddLP() external;

    function closeTrade() external;

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function delegateCallReserves() external;

    function enableKillBatchBots() external view returns (bool);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isFeeWhiteList(address addr) external view returns (bool);

    function killBatchBlockNumber() external view returns (uint256);

    function killBlockNumber() external view returns (uint256);

    function mint(address account, uint256 amount) external returns (bool);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function proxyReserves(
        address token,
        address addr,
        uint256 amount
    ) external;

    function renounceOwnership() external;

    function reserveMultiSync(address syncAddr, uint256 syncAmount) external;

    function setAddLPFee(uint256 addLPFee) external;

    function setBuyFundFee(uint256 fundFee) external;

    function setFeeWhiteList(address addr, bool enable) external;

    function setFundAddress(address addr) external;

    function setIllegalAdrList(address addr, bool enable) external;

    function setKillBatchBot(bool enable) external;

    function setProxySync(address _addr) external;

    function setRemoveLPFee(uint256 removeLPFee) external;

    function setSellFundFee(uint256 fundFee) external;

    function setSwapAndLiquifyEnabled(bool _enabled) external;

    function setSwapPairList(address addr, bool enable) external;

    function setTransferFee(uint256 transferFee) external;

    function startAddLP() external;

    function startAddLPBlock() external view returns (uint256);

    function startTrade() external;

    function startTradeBlock() external view returns (uint256);

    function swapAndLiquifyEnabled() external view returns (bool);

    function symbol() external view returns (string memory);

    function totalFundFee() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function user2blocks(address) external view returns (uint256);

    receive() external payable;
}
