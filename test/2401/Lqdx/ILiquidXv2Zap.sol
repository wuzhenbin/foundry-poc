// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface ISwapPlusv1 {
    struct swapRouter {
        string platform;
        address tokenIn;
        address tokenOut;
        uint256 amountOutMin;
        uint256 meta;
        uint256 percent;
    }

    struct swapLine {
        swapRouter[] swaps;
    }

    struct swapBlock {
        swapLine[] lines;
    }
}

interface LiquidXv2Zap {
    struct swapPath {
        ISwapPlusv1.swapBlock[] path;
    }
}

interface ILiquidXv2Zap {
    function balanceOf(
        address,
        address,
        uint256
    ) external view returns (uint256);

    function deposit(
        address account,
        address token,
        address tokenM,
        LiquidXv2Zap.swapPath memory path,
        address token0,
        address token1,
        uint256[3] memory amount,
        uint256 basketId
    ) external payable returns (uint256);

    function factory() external view returns (address);

    function operatorSetter() external view returns (address);

    function operators(address) external view returns (bool);

    function rewarder() external view returns (address);

    function router() external view returns (address);

    function setOperator(address _operator, bool mode) external;

    function setOperatorSetter(address _operatorSetter) external;

    function setRewarder(address _rewarder) external;

    function setRouterAndFactory(address _router) external;

    function setSwapPlus(address _swapPlus) external;

    function swapPlus() external view returns (address);

    function withdraw(
        address account,
        address token0,
        address token1,
        uint256 amount,
        address tokenOut,
        uint256 basketId,
        address tokenM,
        LiquidXv2Zap.swapPath memory wpath,
        uint256[3] memory amountMin
    ) external returns (uint256);

    function withdrawToken(
        address token,
        address target,
        uint256 amount
    ) external;

    function wrappedETH() external view returns (address);

    receive() external payable;
}
