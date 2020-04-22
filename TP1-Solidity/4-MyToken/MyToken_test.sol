pragma solidity 0.5.16;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./MyToken.sol";


contract MyTokenTest {
    MyToken myToken;

    /// #sender: account-0
    function beforeAll() public {
        myToken = new ERC20("ESGI Coin", "ESGI", 1000);
    }

    /// #sender: account-0
    function checkReceiverGotTheTokens() public {
        myToken.transfer(TestsAccounts.getAccount(1), 200);
        Assert.equal(
            ERC20ToTest.getBalanceOf(TestsAccounts.getAccount(1)),
            200,
            "wrong value"
        );
    }
}
