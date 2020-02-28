pragma solidity 0.5.12;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./erc20.sol";

contract ERC20Test {
    ERC20 ERC20ToTest;

    /// #sender: account-0
    function beforeAll() public {
        ERC20ToTest = new ERC20("YOLO Coin", "YOLO", 1000);
    }

    /// #sender: account-0
    function checkReceiverGotTheTokens() public {
        ERC20ToTest.transfer(TestsAccounts.getAccount(1), 200);
        Assert.equal(
            ERC20ToTest.getBalanceOf(TestsAccounts.getAccount(1)),
            200,
            "wrong value"
        );
    }
}
