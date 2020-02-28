pragma solidity 0.5.12;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./lottery.sol";

contract LotteryTest {
    Lottery lotteryToTest;

    /// #sender: account-0
    function beforeAll() public {
        lotteryToTest = new Lottery();
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
        lotteryToTest.enter();
        address payable[] memory players = lotteryToTest.getPlayers();
        Assert.equal(players.length, 1, "wrong numbers of players");
    }

    /// #sender: account-1
    /// #value: 1
    function checkAnotherPersonCanEnter() public payable {
        lotteryToTest.enter();
        address payable[] memory players = lotteryToTest.getPlayers();
        Assert.equal(players.length, 2, "wrong numbers of players");
    }

    /// #sender: account-0
    function checkManagerCanPickWinner() public {
        lotteryToTest.pickWinner();
        address payable[] memory players = lotteryToTest.getPlayers();
        Assert.equal(players.length, 0, "wrong numbers of players");
    }

    // Cannot be automatically tested with remix yet :
    // - Require a minimun amount of 1 Ether to enter the lottery
    // - Check only manager can call picWinner()
    // - Check the winner balance get all the funds

}
