// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface XBridge {
    struct tokenInfo {
        address token;
        uint256 chain;
    }
}

interface IXbridge {
    event ChainSupported(uint256 _chain, bool _supported);
    event FeeExcludedFromListing(address indexed user, bool ifExcluded);
    event Initialized(uint8 version);
    event Locked(
        address indexed user,
        address indexed inToken,
        address indexed outToken,
        uint256 amount,
        uint256 feeAmount,
        uint256 _nonce,
        uint256 isWrapped,
        uint256 srcId,
        uint256 dstId
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event SignersChanged(address[] indexed newSigners);
    event TokenDelisted(
        address indexed baseToken,
        uint256 baseTokenChain,
        address indexed correspondingToken,
        uint256 correspondingTokenChain
    );
    event TokenDeposited(address indexed user, uint256 amount);
    event TokenFee(address indexed _token, uint256 _fee);
    event TokenListed(
        address indexed baseToken,
        uint256 baseTokenChain,
        address indexed correspondingToken,
        uint256 correspondingTokenChain,
        bool isMintable,
        address indexed user
    );
    event TokenWithdrawn(
        address indexed user,
        address indexed receiver,
        uint256 amount
    );
    event UnLocked(
        address indexed user,
        address indexed outToken,
        uint256 amount,
        uint256 feeAmount,
        uint256 _nonce,
        uint256 srcId,
        uint256 dstId
    );

    fallback() external payable;

    function _tokenOwner(address) external view returns (address);

    function admin(uint256) external view returns (address);

    function chainSupported(uint256) external view returns (bool);

    function changeAdmin(address[] memory newAdmin) external;

    function changeTokenLister(
        address token,
        address newOwner,
        uint256 srcId,
        uint256 dstId
    ) external;

    function claimTax(
        address token,
        bool pairWithEth,
        bool withdrawAnyAmount
    ) external;

    function delistTokenByOwner(
        XBridge.tokenInfo memory baseToken,
        XBridge.tokenInfo memory correspondingToken
    ) external;

    function delistTokenByUser(
        XBridge.tokenInfo memory baseToken,
        XBridge.tokenInfo memory correspondingToken
    ) external;

    function depositTokens(address token, uint256 amount) external payable;

    function excludeFeeFromListing(address) external view returns (bool);

    function factory() external view returns (address);

    function feesForToken(address) external view returns (uint256);

    function getSigners() external view returns (address[] memory);

    function getTotalSigners() external view returns (uint256);

    function inNonce(uint256, address) external view returns (uint256);

    function initialize(
        address[] memory _admin,
        uint256 _listingFee,
        address _tokenFeeCollector,
        address _listingFeeCollector,
        address _router,
        address _factory,
        address _usdt
    ) external;

    function isBase(address) external view returns (bool);

    function isMintable(address, address) external view returns (bool);

    function isMintableWithChainId(
        uint256,
        uint256,
        address,
        address
    ) external view returns (bool);

    function isWrapped(address) external view returns (bool);

    function isWrappedWithChainId(
        uint256,
        uint256,
        address
    ) external view returns (bool);

    function listToken(
        XBridge.tokenInfo memory baseToken,
        XBridge.tokenInfo memory correspondingToken,
        bool _isMintable
    ) external payable;

    function listingFee() external view returns (uint256);

    function listingFeeCollector() external view returns (address);

    function lock(
        address inToken,
        uint256 _amount,
        uint256 dstId
    ) external payable;

    function migrateData(
        XBridge.tokenInfo memory baseToken,
        XBridge.tokenInfo memory correspondingToken,
        bool _isMintable,
        address lister
    ) external;

    function native() external view returns (address);

    function nonceProcessed(
        uint256,
        address,
        uint256
    ) external view returns (bool);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function router() external view returns (address);

    function setChainSupported(uint256 chainId, bool supported) external;

    function setExcludeFeeFromListing(address user, bool ifExcluded) external;

    function setFeeCollector(address collector) external;

    function setFeeForToken(address token, uint256 fee) external;

    function setListingFee(uint256 newFee) external;

    function setListingFeeCollector(address collector) external;

    function setNative(address _native) external;

    function setRouter(address _router) external;

    function setThresholdLimit(uint256 _amount) external;

    function setUsdt(address _usdt) external;

    function thresholdLimit() external view returns (uint256);

    function tokenChainId(address) external view returns (uint256);

    function tokenDeposited(address, address) external view returns (uint256);

    function tokenFeeCollector() external view returns (address);

    function tokenOwner(address, address) external view returns (address);

    function tokenOwnerWithChainId(
        uint256,
        uint256,
        address,
        address
    ) external view returns (address);

    function tokenTax(address) external view returns (uint256);

    function tokenToToken(address) external view returns (address);

    function tokenToTokenWithChainId(
        uint256,
        uint256,
        address
    ) external view returns (address);

    function tokenWithdrawn(address, address) external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function unlock(
        address inToken,
        uint256 amount,
        uint256 feeAmount,
        uint256 _nonce,
        uint256 _isWrapped,
        uint256 srcId,
        bytes32[] memory r,
        bytes32[] memory s,
        uint8[] memory v
    ) external payable;

    function usdt() external view returns (address);

    function viewTax(
        address token,
        bool pairWithEth
    ) external view returns (uint256 _amount);

    function withdrawTokens(
        address token,
        address receiver,
        uint256 amount
    ) external;

    receive() external payable;
}
