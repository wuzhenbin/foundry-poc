// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ISTCToken {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event BatchAirDropped(string _batchId);
    event FeesChanged();
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function ETHAmount()
        external
        view
        returns (uint256 capital, uint256 development);

    function USDT() external view returns (address);

    function _lastTrade(address) external view returns (uint256);

    function addPair(address _pair) external;

    function airdropTokens(
        address[] memory recipients,
        uint256[] memory amounts,
        string memory _batchId
    ) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function bulkAntiBot(address[] memory accounts, bool state) external;

    function burnAddress() external view returns (address);

    function canAirdrop(address) external view returns (bool);

    function capitalAddress() external view returns (address);

    function coolDownEnabled() external view returns (bool);

    function coolDownTime() external view returns (uint256);

    function decimals() external pure returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function developmentAddress() external view returns (address);

    function excludeFromFee(address account) external;

    function excludeFromReward(address account) external;

    function includeInFee(address account) external;

    function includeInReward(address account) external;

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function isBot(address account) external view returns (bool);

    function isExcludedFromFee(address account) external view returns (bool);

    function isExcludedFromReward(address account) external view returns (bool);

    function isPair(address account) external view returns (bool);

    function maxTxAmount() external view returns (uint256);

    function name() external pure returns (string memory);

    function owner() external view returns (address);

    function pair() external view returns (address);

    function removePair(address _pair) external;

    function renounceOwnership() external;

    function rescueAnyERC20Tokens(
        address _tokenAddr,
        address _to,
        uint256 _amount
    ) external;

    function rescueETH(uint256 weiAmount) external;

    function router() external view returns (address);

    function setAirdropControl(
        address[] memory _addr,
        bool[] memory _access
    ) external;

    function setAntibot(address account, bool state) external;

    function setBuySplitETH(uint256 _capital, uint256 _development) external;

    function setBuyTaxes(
        uint256 _reflection,
        uint256 _capital,
        uint256 _development,
        uint256 _burn,
        uint256 _treasury
    ) external;

    function setSellSplitETH(uint256 _capital, uint256 _development) external;

    function setSellTaxes(
        uint256 _reflection,
        uint256 _capital,
        uint256 _development,
        uint256 _burn,
        uint256 _treasury
    ) external;

    function setWalletToWalletSplitETH(
        uint256 _capital,
        uint256 _development
    ) external;

    function setWalletToWalletTaxes(
        uint256 _reflection,
        uint256 _capital,
        uint256 _development,
        uint256 _burn,
        uint256 _treasury
    ) external;

    function swapTokensAtAmount() external view returns (uint256);

    function symbol() external pure returns (string memory);

    function tokenFromReflection(
        uint256 rAmount
    ) external view returns (uint256);

    function totFeesPaid()
        external
        view
        returns (
            uint256 reflection,
            uint256 capital,
            uint256 development,
            uint256 burn,
            uint256 treasury
        );

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

    function updateBurnWallet(address newWallet) external;

    function updateCapitalWallet(address newWallet) external;

    function updateCoolDownSettings(
        bool _enabled,
        uint256 _timeInSeconds
    ) external;

    function updateMaxTxAmt(uint256 amount) external;

    function updateRouterAndPair(address newRouter, address newPair) external;

    function updateStableCoin(address _USDT) external;

    function updateSwapTokensAtAmount(
        uint256 amount,
        uint256 stableTokenDecimal
    ) external;

    function updatedevelopmentWallet(address newWallet) external;

    receive() external payable;
}
