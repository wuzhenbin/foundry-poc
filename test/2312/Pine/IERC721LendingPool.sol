// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IERC721LendingPool {
    function flashLoan(
        address _receiver,
        address _reserve,
        uint256 _amount,
        bytes memory _params
    ) external;

    function repay(
        uint256 nftID,
        uint256 repayAmount,
        address pineWallet
    ) external returns (bool);

    function _loans(
        uint256
    )
        external
        view
        returns (
            uint256 loanStartBlock,
            uint256 loanExpireTimestamp,
            uint32 interestBPS1000000XBlock,
            uint32 maxLTVBPS,
            uint256 borrowedWei,
            uint256 returnedWei,
            uint256 accuredInterestWei,
            uint256 repaidInterestWei,
            address borrower
        );
}
