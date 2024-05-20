// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IFlashLoanSimpleReceiver {
    /**
     * @notice 在接收闪电借款资产后执行操作
     * @dev 确保合约能够归还债务 + 额外费用，例如，具有
     *      足够的资金来偿还，并已批准 Pool 提取总金额
     * @param asset 闪电借款资产的地址
     * @param amount 闪电借款资产的数量
     * @param premium 闪电借款资产的费用
     * @param initiator 发起闪电贷款的地址
     * @param params 初始化闪电贷款时传递的字节编码参数
     * @return 如果操作的执行成功则返回 True，否则返回 False
     */
    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool);
}

// AAVE V3 Pool interface
interface ILendingPool {
    function flashLoan(
        address receiverAddress,
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata interestRateModes,
        address onBehalfOf,
        bytes calldata params,
        uint16 referralCode
    ) external;

    // flashloan of single asset
    function flashLoanSimple(
        address receiverAddress,
        address asset,
        uint256 amount,
        bytes calldata params,
        uint16 referralCode
    ) external;

    // get the fee on flashloan, default at 0.05%
    function FLASHLOAN_PREMIUM_TOTAL() external view returns (uint128);
}
