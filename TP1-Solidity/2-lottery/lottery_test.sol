pragma solidity 0.6.1;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./lottery.sol";

contract LotteryTest {
    Lottery lotteryToTest;

    /// #sender: account-0
    function beforeAll() public {
        lotteryToTest = new Lottery();
    }

    /// #sender: account-1
    /// #value: 1
    function checkSenderIs0AndValueis10() public payable {
        Assert.equal(
            msg.sender,
            TestsAccounts.getAccount(1),
            "wrong sender in checkSenderIs0AndValueis10"
        );
        Assert.equal(msg.value, 1, "wrong value in checkSenderIs0AndValueis10");
    }

    /// #sender: account-1
    /// #value: 100000000000000000
    function checkOnePersonCanEnter() public payable {
        lotteryToTest.enter();
        Assert.equal(
            msg.value,
            100000000000000000,
            "wrong value in checkSenderIs0AndValueis10"
        );
        Assert.notEqual(
            msg.sender,
            TestsAccounts.getAccount(2),
            "wrong sender in checkSenderIsnt2"
        );
        address payable[] memory players = lotteryToTest.getPlayers();
        Assert.equal(players.length, 1, "wrong numbers of players");
    }
}
