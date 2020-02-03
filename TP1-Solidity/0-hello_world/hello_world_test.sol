pragma solidity 0.5.12;

import "remix_tests.sol";
import "./hello_world.sol";

contract HelloWorldTest {
    HelloWorld helloWorldToTest;

    function beforeAll() public {
        helloWorldToTest = new HelloWorld();
    }

    function checkHelloWorld() public {
        string memory expected = "Hello World";
        Assert.equal(
            helloWorldToTest.speak(),
            expected,
            "Hello world not returned"
        );
    }
}
