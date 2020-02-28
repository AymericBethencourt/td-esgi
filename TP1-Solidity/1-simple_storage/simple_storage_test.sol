pragma solidity 0.5.12;

// eslint-disable-next-line no-alert, quotes, semi
import "remix_tests.sol";
import "./simple_storage.sol";

contract SimpleStorageTest {
    SimpleStorage simpleStorageToTest;

    function beforeAll() public {
        simpleStorageToTest = new SimpleStorage(42);
    }

    function checkInitialValue() public {
        Assert.equal(
            simpleStorageToTest.get(),
            42,
            "Initial value is not correct"
        );
    }

    function checkSettingAValue() public {
        simpleStorageToTest.set(43);
        Assert.equal(simpleStorageToTest.get(), 43, "Set value is not correct");
    }
}
