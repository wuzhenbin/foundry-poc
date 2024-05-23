// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!
pragma solidity ^0.8.4;

interface ITransitSwapRouterV5 {
    fallback() external;

    function CHECKFEE_TYPEHASH() external view returns (bytes32);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function acceptExecutorship() external;

    function aggregate(
        BaseCore.TransitSwapDescription memory desc,
        BaseCore.CallbytesDescription memory callbytesDesc
    ) external payable returns (uint256 returnAmount);

    function aggregateAndGasUsed(
        BaseCore.TransitSwapDescription memory desc,
        BaseCore.CallbytesDescription memory callbytesDesc
    ) external payable returns (uint256 returnAmount, uint256 gasUsed);

    function changeAllowed(
        address[] memory crossCallers,
        address[] memory wrappedTokens
    ) external;

    function changeFee(
        bool[] memory isAggregate,
        uint256[] memory newRate
    ) external;

    function changePause(bool paused) external;

    function changeTransitProxy(address aggregator, address signer) external;

    function changeUniswapV3FactoryAllowed(
        uint256[] memory poolIndex,
        address[] memory factories,
        bytes[] memory initCodeHash
    ) external;

    function cross(BaseCore.CrossDescription memory desc) external payable;

    function exactInputV2Swap(
        BaseCore.ExactInputV2SwapParams memory exactInput,
        uint256 deadline
    ) external payable returns (uint256 returnAmount);

    function exactInputV2SwapAndGasUsed(
        BaseCore.ExactInputV2SwapParams memory exactInput,
        uint256 deadline
    ) external payable returns (uint256 returnAmount, uint256 gasUsed);

    function exactInputV3Swap(
        BaseCore.ExactInputV3SwapParams memory params
    ) external payable returns (uint256 returnAmount);

    function exactInputV3SwapAndGasUsed(
        BaseCore.ExactInputV3SwapParams memory params
    ) external payable returns (uint256 returnAmount, uint256 gasUsed);

    function executor() external view returns (address);

    function pancakeV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes memory _data
    ) external;

    function paused() external view returns (bool);

    function pendingExecutor() external view returns (address);

    function transferExecutorship(address newExecutor) external;

    function transitAllowedQuery(
        address crossCaller,
        address wrappedToken,
        uint256 poolIndex
    )
        external
        view
        returns (
            bool isCrossCallerAllowed,
            bool isWrappedAllowed,
            BaseCore.UniswapV3Pool memory pool
        );

    function transitFee() external view returns (uint256, uint256);

    function transitProxyAddress()
        external
        view
        returns (address bridgeProxy, address feeSigner);

    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes memory _data
    ) external;

    function withdrawTokens(
        address[] memory tokens,
        address recipient
    ) external;

    receive() external payable;
}

interface BaseCore {
    struct TransitSwapDescription {
        address srcToken;
        address dstToken;
        address dstReceiver;
        address wrappedToken;
        uint256 amount;
        uint256 minReturnAmount;
        uint256 fee;
        string channel;
        bytes signature;
    }

    struct CallbytesDescription {
        address srcToken;
        bytes calldatas;
    }

    struct CrossDescription {
        address srcToken;
        address dstToken;
        address caller;
        address dstReceiver;
        address wrappedToken;
        uint256 amount;
        uint256 fee;
        uint256 toChain;
        string channel;
        bytes calls;
        bytes signature;
    }

    struct ExactInputV2SwapParams {
        address dstReceiver;
        address wrappedToken;
        uint256 router;
        uint256 amount;
        uint256 minReturnAmount;
        uint256 fee;
        address[] path;
        address[] pool;
        bytes signature;
        string channel;
    }

    struct ExactInputV3SwapParams {
        address srcToken;
        address dstToken;
        address dstReceiver;
        address wrappedToken;
        uint256 amount;
        uint256 minReturnAmount;
        uint256 fee;
        uint256 deadline;
        uint256[] pools;
        bytes signature;
        string channel;
    }

    struct UniswapV3Pool {
        address factory;
        bytes initCodeHash;
    }
}
