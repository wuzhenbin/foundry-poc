// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IOsn {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event ProcessedDividendTracker(
        uint256 iterations,
        uint256 claims,
        uint256 lastProcessedIndex,
        bool indexed automatic,
        uint256 gas,
        address indexed processor
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function __getReserves()
        external
        view
        returns (uint256 rOther, uint256 rThis);

    function _baseToken() external view returns (address);

    function _blacklist(address) external view returns (bool);

    function _getReserves()
        external
        view
        returns (uint256 rOther, uint256 rThis, uint256 balanceOther);

    function _tokenDistributor() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function automatedMarketMakerPairs(address) external view returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function buyFees() external view returns (uint256);

    function claimStuckETH() external;

    function claimStuckToken(address _token, uint256 _amount) external;

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function exceludeLPDividend(address _account) external;

    function excludeFromBlacklist(address account, bool excluded) external;

    function excludeFromFees(address account, bool excluded) external;

    function excludeMultipleAccountsFromFees(
        address[] memory accounts,
        bool excluded
    ) external;

    function gasForProcessing() external view returns (uint256);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isExcludedFromFees(address account) external view returns (bool);

    function lpDividendTracker() external view returns (address);

    function marketAddress() external view returns (address);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function receiveAddress() external view returns (address);

    function renounceOwnership() external;

    function sellFees() external view returns (uint256);

    function setBuyFees(uint256 _buyFees) external;

    function setSellFees(uint256 _sellFees) external;

    function setStartTime(uint256 _starttime) external;

    function setTxLimit(uint256 _txLimit) external;

    function startSwapTime() external view returns (uint256);

    function swapTokensAtAmount() external view returns (uint256);

    function symbol() external view returns (string memory);

    function taxAddress() external view returns (address);

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

    function txLimit() external view returns (uint256);

    function uniswapV2Pair() external view returns (address);

    function uniswapV2Router() external view returns (address);

    function updateGasForProcessing(uint256 newValue) external;

    function updateSwapTokensAtAmount(uint256 _swapTokensAtAmount) external;

    receive() external payable;
}
