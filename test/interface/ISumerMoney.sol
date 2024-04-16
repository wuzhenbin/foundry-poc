// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface ICEther {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Initialized(uint8 version);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewDiscountRate(
        uint256 oldDiscountRateMantissa,
        uint256 newDiscountRateMantissa
    );
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function _acceptAdmin() external returns (uint256);

    function _addReserves() external payable returns (uint256);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setDiscountRate(
        uint256 discountRateMantissa_
    ) external returns (uint256);

    function _setInterestRateModel(
        address newInterestRateModel
    ) external returns (uint256);

    function _setPendingAdmin(
        address newPendingAdmin
    ) external returns (uint256);

    function _setReserveFactor(
        uint256 newReserveFactorMantissa
    ) external returns (uint256);

    function _syncUnderlyingBalance() external;

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function discountRateMantissa() external view returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountBorrows(
        address account
    ) external view returns (uint256 principal, uint256 interestIndex);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256, uint256);

    function getCash() external view returns (uint256);

    function getDiscountRate() external view returns (uint256);

    function initialize(
        address comptroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address admin_,
        uint256 discountRateMantissa_
    ) external;

    function interestRateModel() external view returns (address);

    function isCEther() external view returns (bool);

    function isCToken() external view returns (bool);

    function isDeprecated() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        address cTokenCollateral
    ) external payable;

    function liquidateBorrowAllowed(
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external view returns (uint256);

    function liquidateCalculateSeizeTokens(
        address cTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256, uint256);

    function mint() external payable;

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function protocolSeizeShareMantissa() external view returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow() external payable;

    function repayBorrowBehalf(address borrower) external payable;

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens,
        uint256 seizeProfitTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);

    function underlyingBalance() external view returns (uint256);

    receive() external payable;
}

interface ICErc20 {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Initialized(uint8 version);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewDiscountRate(
        uint256 oldDiscountRateMantissa,
        uint256 newDiscountRateMantissa
    );
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function _acceptAdmin() external returns (uint256);

    function _addReserves(uint256 addAmount) external returns (uint256);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setDiscountRate(
        uint256 discountRateMantissa_
    ) external returns (uint256);

    function _setInterestRateModel(
        address newInterestRateModel
    ) external returns (uint256);

    function _setPendingAdmin(
        address newPendingAdmin
    ) external returns (uint256);

    function _setReserveFactor(
        uint256 newReserveFactorMantissa
    ) external returns (uint256);

    function _syncUnderlyingBalance() external;

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(
        address account
    ) external view returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function discountRateMantissa() external view returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountBorrows(
        address account
    ) external view returns (uint256 principal, uint256 interestIndex);

    function getAccountSnapshot(
        address account
    ) external view returns (uint256, uint256, uint256, uint256);

    function getCash() external view returns (uint256);

    function getDiscountRate() external view returns (uint256);

    function initialize(
        address underlying_,
        address comptroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address admin_,
        uint256 discountRateMantissa_
    ) external;

    function interestRateModel() external view returns (address);

    function isCEther() external view returns (bool);

    function isCToken() external view returns (bool);

    function isDeprecated() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral
    ) external returns (uint256);

    function liquidateBorrowAllowed(
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external view returns (uint256);

    function liquidateCalculateSeizeTokens(
        address cTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256, uint256);

    function mint(uint256 mintAmount) external returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function protocolSeizeShareMantissa() external view returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function repayBorrowBehalf(
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens,
        uint256 seizeProfitTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function sweepToken(address token) external;

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);

    function underlyingBalance() external view returns (uint256);
}

interface ITimelock {
    struct Underlying {
        address cToken;
        uint256 totalBalance;
        uint256 lockDuration;
        bool isSupport;
    }

    struct Agreement {
        uint256 agreementId;
        uint8 actionType;
        address underlying;
        bool isFrozen;
        address beneficiary;
        uint256 releaseTime;
        uint256 amount;
    }

    event AgreementClaimed(
        uint256 agreementId,
        uint8 actionType,
        address indexed asset,
        uint256 amount,
        address indexed beneficiary
    );
    event AgreementCreated(
        uint256 agreementId,
        uint8 actionType,
        address indexed asset,
        uint256 amount,
        address indexed beneficiary,
        uint256 releaseTime
    );
    event AgreementFrozen(uint256 agreementId, bool value);
    event RescueERC20(
        address indexed token,
        address indexed to,
        uint256 amount
    );
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event TimeLockFrozen(bool value);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function EMERGENCY_ADMIN() external view returns (bytes32);

    function agreementCount() external view returns (uint256);

    function cTokenToUnderlying(address) external view returns (address);

    function claim(uint256[] memory agreementIds) external;

    function createAgreement(
        uint8 actionType,
        address underlying,
        uint256 amount,
        address beneficiary
    ) external returns (uint256);

    function freezeAgreement(uint256 agreementId) external;

    function freezeAllAgreements() external;

    function frozen() external view returns (bool);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function getRoleMember(
        bytes32 role,
        uint256 index
    ) external view returns (address);

    function getRoleMemberCount(bytes32 role) external view returns (uint256);

    function grantRole(bytes32 role, address account) external;

    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);

    function isSupport(address underlying) external view returns (bool);

    function renounceRole(bytes32 role, address account) external;

    function rescueERC20(address token, address to, uint256 amount) external;

    function revokeRole(bytes32 role, address account) external;

    function setLockDuration(address underlying, uint256 lockDuration) external;

    function setUnderly(
        address cToken,
        address underlying,
        bool isSupport
    ) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function underlyingDetail(
        address
    )
        external
        view
        returns (
            address cToken,
            uint256 totalBalance,
            uint256 lockDuration,
            bool isSupport
        );

    function underlyingDetails(
        address[] memory underlyings
    ) external view returns (ITimelock.Underlying[] memory);

    function unfreezeAllAgreements() external;

    function userAgreements(
        address user
    ) external view returns (ITimelock.Agreement[] memory);

    receive() external payable;
}

interface ICbETH {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Burn(address indexed account, uint256 amount);
    event Initialized(uint8 version);
    event Mint(address indexed account, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function BRIDGE() external view returns (address);

    function REMOTE_TOKEN() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function bridge() external view returns (address);

    function burn(address _from, uint256 _amount) external;

    function decimals() external view returns (uint8);

    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);

    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);

    function initialize(string memory _name, string memory _symbol) external;

    function l1Token() external view returns (address);

    function l2Bridge() external view returns (address);

    function mint(address _to, uint256 _amount) external;

    function name() external view returns (string memory);

    function remoteToken() external view returns (address);

    function supportsInterface(
        bytes4 _interfaceId
    ) external pure returns (bool);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function version() external view returns (string memory);
}
