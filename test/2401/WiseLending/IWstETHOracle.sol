// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IWstETHOracle {
    function ST_ETH_FEED() external view returns (address);

    function WST_ETH() external view returns (address);

    function decimals() external pure returns (uint8);

    function decimalsDifference() external view returns (uint8);

    function decimalsPriceStETH() external view returns (uint8);

    function decimalsWstETH() external view returns (uint8);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestAnswer() external view returns (uint256);

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}
