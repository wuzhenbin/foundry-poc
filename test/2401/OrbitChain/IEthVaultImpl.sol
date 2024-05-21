// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IEthVaultImpl {
    function owners(uint256) external view returns (address);

    function transferToFarm(address token, uint256 amount) external;

    function chainAddressLength(bytes32) external view returns (uint256);

    function chainFeeWithData(bytes32) external view returns (uint256);

    function depositToken(
        address token,
        string memory toChain,
        bytes memory toAddr,
        uint256 amount
    ) external payable;

    function getVersion() external pure returns (string memory);

    function withdraw(
        address hubContract,
        string memory fromChain,
        bytes memory fromAddr,
        address toAddr,
        address token,
        bytes32[] memory bytes32s,
        uint256[] memory uints,
        bytes memory data,
        uint8[] memory v,
        bytes32[] memory r,
        bytes32[] memory s
    ) external;

    function depositCount() external view returns (uint256);

    function isOwner(address) external view returns (bool);

    function setSilentToken(address token, bool v) external;

    function getChainId(string memory _chain) external view returns (bytes32);

    function confirmations(uint256, address) external view returns (bool);

    function depositNFT(
        address token,
        string memory toChain,
        bytes memory toAddr,
        uint256 tokenId,
        bytes memory data
    ) external payable;

    function changeActivate(bool activate) external;

    function tetherAddress() external view returns (address);

    function farms(address) external view returns (address);

    function bytesToAddress(
        bytes memory bys
    ) external pure returns (address addr);

    function isActivated() external view returns (bool);

    function addFarm(address token, address proxy) external;

    function silentTokenList(address) external view returns (bool);

    function setWrappedAddress(
        bool set,
        address token,
        address wrapped
    ) external;

    function policyAdmin() external view returns (address);

    function implementation() external view returns (address);

    function wrappedDeposit(address) external view returns (address);

    function gasLimitForBridgeReceiver() external view returns (uint256);

    function depositNFT(
        address token,
        string memory toChain,
        bytes memory toAddr,
        uint256 tokenId
    ) external payable;

    function tokenAddr(bytes32) external view returns (address);

    function nonTaxable(address) external view returns (bool);

    function taxRate() external view returns (uint256);

    function removeFarm(address token, address newProxy) external;

    function bridgingFee() external view returns (uint256);

    function setNonTaxableAddress(address target, bool valid) external;

    function withdrawNFT(
        address hubContract,
        string memory fromChain,
        bytes memory fromAddr,
        address toAddr,
        address token,
        bytes32[] memory bytes32s,
        uint256[] memory uints,
        bytes memory data,
        uint8[] memory v,
        bytes32[] memory r,
        bytes32[] memory s
    ) external;

    function transactions(
        uint256
    )
        external
        view
        returns (
            address destination,
            uint256 value,
            bytes memory data,
            bool executed
        );

    function isUsedWithdrawal(bytes32) external view returns (bool);

    function deposit(
        string memory toChain,
        bytes memory toAddr,
        bytes memory data
    ) external payable;

    function setValidChain(
        string memory _chain,
        bool valid,
        uint256 fromAddrLen,
        uint256 uintsLen
    ) external;

    function setPolicyAdmin(address _policyAdmin) external;

    function feeGovernance() external view returns (address);

    function setTaxParams(uint256 _taxRate, address _taxReceiver) external;

    function transactionCount() external view returns (uint256);

    function chainFee(bytes32) external view returns (uint256);

    function chain() external view returns (string memory);

    function setGasLimitForBridgeReceiver(
        uint256 _gasLimitForBridgeReceiver
    ) external;

    function unwrappedWithdraw(address) external view returns (address);

    function deposit(
        string memory toChain,
        bytes memory toAddr
    ) external payable;

    function MAX_OWNER_COUNT() external view returns (uint256);

    function required() external view returns (uint256);

    function setFeeGovernance(address _feeGovernance) external;

    function tokenSummaries(address) external view returns (bytes32);

    function setUsedWithdrawal(bytes32 whash, bool v) external;

    function taxReceiver() external view returns (address);

    function isValidChain(bytes32) external view returns (bool);

    function setChainFee(
        string memory chainSymbol,
        uint256 _fee,
        uint256 _feeWithData
    ) external;

    function dai() external view returns (address);

    function chainUintsLength(bytes32) external view returns (uint256);

    function depositToken(
        address token,
        string memory toChain,
        bytes memory toAddr,
        uint256 amount,
        bytes memory data
    ) external payable;

    function edai() external view returns (address);
}
