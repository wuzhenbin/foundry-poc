// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ILinearVesting {
    event LinearReleaseDeployed(uint256 index);
    event Released(uint256 index, address beneficiary, uint256 amount);

    function addLinearVesting(address beneficiary, uint256 amount) external;

    function addLinearVesting(
        bytes32 txHash,
        address beneficiary,
        uint256 amount,
        uint8 mode
    ) external;

    function addRedeemLinearVesting(
        address beneficiary,
        uint256 amount,
        uint8 mode
    ) external;

    function blocklist(uint256) external view returns (bool);

    function defaultStart() external view returns (uint256);

    function getMode(uint256 index) external view returns (uint8);

    function getModeInfos(
        uint8 key
    ) external view returns (uint256 infoPeriods, uint256 infoInterval);

    function getReleasableAmount(uint256 index) external view returns (uint256);

    function getSwitch(uint256 index) external view returns (bool);

    function getUsedTxHashes(bytes32 txHash) external view returns (bool);

    function getVestingSchedules()
        external
        view
        returns (VestingSchedule[] memory);

    function handler() external view returns (address);

    function init(
        address initToken,
        uint256 initPeriods,
        uint256 initInterval
    ) external;

    function interval() external view returns (uint256);

    function owner() external view returns (address);

    function periods() external view returns (uint256);

    function release(uint256 index) external;

    function releaseSwitch() external view returns (bool);

    function setBlocklistBatch(uint256[] memory indices, bool value) external;

    function setDefaultStart(uint256 newDefaultStart) external;

    function setHandler(address newHandler) external;

    function setModeInfos(
        uint8 key,
        uint256 newPeriods,
        uint256 newInterval
    ) external;

    function setSwitch(uint8 key, bool value) external;

    function setSwitchOperator(address newSwitchOperator) external;

    function switchOperator() external view returns (address);

    function token() external view returns (address);

    function transferOwner(address owner_) external;

    function vestingSchedules(
        uint256
    )
        external
        view
        returns (
            uint256 start,
            address beneficiary,
            uint256 amount,
            uint256 released
        );

    function withdraw(
        address otherToken,
        uint256 amount,
        address receiver
    ) external;
}

struct VestingSchedule {
    uint256 start;
    address beneficiary;
    uint256 amount;
    uint256 released;
}
