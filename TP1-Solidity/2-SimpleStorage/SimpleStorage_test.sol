pragma solidity 0.5.16;

import "remix_tests.sol";
import "./SimpleStorage.sol";


contract SimpleStorageTest {
    SimpleStorage simpleStorage;

    function beforeAll() public {
        simpleStorage = new SimpleStorage(42);
    }

    function checkInitialValue() public {
        Assert.equal(simpleStorage.get(), 42, "Initial value is not correct");
    }

    function checkSettingAValue() public {
        simpleStorage.set(43);
        Assert.equal(simpleStorage.get(), 43, "Set value is not correct");
    }
}
