// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IWeightedIndex {
    event AddLiquidity(
        address indexed wallet,
        uint256 amountTokens,
        uint256 amountDAI
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Bond(
        address indexed wallet,
        address indexed token,
        uint256 amountTokensBonded,
        uint256 amountTokensMinted
    );
    event Create(address indexed newIdx, address indexed wallet);
    event Debond(address indexed wallet, uint256 amountDebonded);
    event FlashLoan(
        address indexed executor,
        address indexed recipient,
        address token,
        uint256 amount
    );
    event RemoveLiquidity(address indexed wallet, uint256 amountLiquidity);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function BOND_FEE() external view returns (uint256);

    function DEBOND_FEE() external view returns (uint256);

    function FLASH_FEE_DAI() external view returns (uint256);

    function addLiquidityV2(
        uint256 _idxLPTokens,
        uint256 _daiLPTokens,
        uint256 _slippage
    ) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function bond(address _token, uint256 _amount) external;

    function created() external view returns (uint256);

    function debond(uint256 _amount, address[] memory, uint8[] memory) external;

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function flash(
        address _recipient,
        address _token,
        uint256 _amount,
        bytes memory _data
    ) external;

    function getAllAssets()
        external
        view
        returns (IDecentralizedIndex.IndexAssetInfo[] memory);

    function getIdxPriceUSDX96() external view returns (uint256, uint256);

    function getTokenPriceUSDX96(
        address _token
    ) external view returns (uint256);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function indexTokens(
        uint256
    )
        external
        view
        returns (
            address token,
            uint256 weighting,
            uint256 basePriceUSDX96,
            address c1,
            uint256 q1
        );

    function indexType() external view returns (uint8);

    function isAsset(address _token) external view returns (bool);

    function lpRewardsToken() external view returns (address);

    function lpStakingPool() external view returns (address);

    function name() external view returns (string memory);

    function removeLiquidityV2(
        uint256 _lpTokens,
        uint256 _minIdxTokens,
        uint256 _minDAI
    ) external;

    function rescueERC20(address _token) external;

    function rescueETH() external;

    function symbol() external view returns (string memory);

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

    receive() external payable;
}

interface IDecentralizedIndex {
    struct IndexAssetInfo {
        address token;
        uint256 weighting;
        uint256 basePriceUSDX96;
        address c1;
        uint256 q1;
    }
}
