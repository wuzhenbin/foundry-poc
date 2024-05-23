// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IBatchSwap {
    function CRYPTOPUNK() external view returns (address);

    function TRADESQUAD() external view returns (address);

    function VAULT() external view returns (address);

    function cancelSwapIntent(uint256 _swapId) external;

    function claimPunkOnProxy(uint256 _punkId) external;

    function closeSwapIntent(
        address _swapCreator,
        uint256 _swapId
    ) external payable;

    function createSwapIntent(
        BatchSwap.swapIntent memory _swapIntent,
        BatchSwap.swapStruct[] memory _nftsOne,
        BatchSwap.swapStruct[] memory _nftsTwo
    ) external payable;

    function editCounterPart(uint256 _swapId, address _counterPart) external;

    function getPunkProxy(address _address) external view returns (address);

    function getSwapIntentByAddress(
        address _creator,
        uint256 _swapId
    ) external view returns (BatchSwap.swapIntent memory);

    function getSwapStruct(
        uint256 _swapId,
        bool _nfts,
        uint256 _index
    ) external view returns (BatchSwap.swapStruct memory);

    function getSwapStructSize(
        uint256 _swapId,
        bool _nfts
    ) external view returns (uint256);

    function getWeiPayValueAmount() external view returns (uint256);

    function getWhiteList(address _address) external view returns (bool);

    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] memory id,
        uint256[] memory value,
        bytes memory data
    ) external returns (bytes4);

    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes memory data
    ) external returns (bytes4);

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes memory data
    ) external returns (bytes4);

    function owner() external view returns (address);

    function paused() external view returns (bool);

    function registerPunkProxy() external;

    function renounceOwnership() external;

    function setCryptoPunkAddress(address _cryptoPunk) external;

    function setDappRelation(address _dapp, address _customInterface) external;

    function setPayment(bool _status, uint256 _value) external;

    function setTradeSquadAddress(address _tradeSquad) external;

    function setVaultAddress(address _vault) external;

    function setWhitelist(address _dapp, bool _status) external;

    function supportsInterface(bytes4 interfaceID) external view returns (bool);

    function transferOwnership(address newOwner) external;

    receive() external payable;
}

interface BatchSwap {
    struct swapIntent {
        uint256 id;
        address addressOne;
        uint256 valueOne;
        address addressTwo;
        uint256 valueTwo;
        uint256 swapStart;
        uint256 swapEnd;
        uint256 swapFee;
        uint8 status;
    }

    struct swapStruct {
        address dapp;
        address typeStd;
        uint256[] tokenId;
        uint256[] blc;
        bytes data;
    }
}
