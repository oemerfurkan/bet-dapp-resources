//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.9;

// We import this library to be able to use console.log
import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// This is the main building block for smart contracts.
contract Bet is Ownable, ERC20{

    constructor() ERC20("BETToken", "BTT") {
        _mint(address(this), 1000 * 10 ** 18);
    }

    uint256 etherPerToken = 0.01 ether;
    uint256 minBetAmount = 0.01 ether;
    mapping(address => uint256) yesBets;
    mapping(address => uint256) noBets;
    uint256 betYes;
    uint256 betNo;

    struct BetObject {
        uint256 betId;
        string betName;
    }

    BetObject[] public bets;

    function buyTokens() public payable {
        require(msg.value > 0, "msg.value cannot be zero.");
        uint256 tokenAmount = msg.value / etherPerToken;
        ERC20.transfer(msg.sender, tokenAmount);
        console.log(tokenAmount);
    }

    function createBet(string calldata _betName, uint256 _betId) public payable onlyOwner {
    }

    function voteYes() public payable {
        require(msg.value > 0);
        
    }
}
