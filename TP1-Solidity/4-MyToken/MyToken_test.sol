pragma solidity 0.5.16;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./MyToken.sol";

contract MyTokenTest {
    MyToken myToken;

    /// #sender: account-0
    function beforeAll() public {
        myToken = new MyToken("YOLO Coin", "YOLO", 1000);
    }

    /// #sender: account-0
    function checkReceiverGotTheTokens() public {
        myToken.transfer(TestsAccounts.getAccount(1), 200);
        Assert.equal(
            myToken.balanceOf(TestsAccounts.getAccount(1)),
            200,
            "wrong value"
        );
    }
}
