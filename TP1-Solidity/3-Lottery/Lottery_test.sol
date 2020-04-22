pragma solidity 0.5.16;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./Lottery.sol";

contract LotteryTest {
    Lottery lottery;

    /// #sender: account-0
    function beforeAll() public {
        lottery = new Lottery();
    }

    /// #sender: account-0
    /// #value: 1
    function checkSenderAndValue() public payable {
        Assert.equal(msg.sender, TestsAccounts.getAccount(0), "wrong sender");
        Assert.equal(msg.value, 1, "wrong value");
    }

    /// #sender: account-0
    /// #value: 1
    function checkOnePersonCanEnter() public payable {
        lottery.enter();
        address payable[] memory players = lottery.getPlayers();
        Assert.equal(players.length, 1, "wrong numbers of players");
    }

    /// #sender: account-1
    /// #value: 1
    function checkAnotherPersonCanEnter() public payable {
        lottery.enter();
        address payable[] memory players = lottery.getPlayers();
        Assert.equal(players.length, 2, "wrong numbers of players");
    }

    /// #sender: account-0
    function checkManagerCanPickWinner() public {
        lottery.pickWinner();
        address payable[] memory players = lottery.getPlayers();
        Assert.equal(players.length, 0, "wrong numbers of players");
    }

    // Cannot be automatically tested with remix yet :
    // - Require a minimun amount of 1 Ether to enter the lottery
    // - Check only manager can call picWinner()
    // - Check the winner balance get all the funds

}
