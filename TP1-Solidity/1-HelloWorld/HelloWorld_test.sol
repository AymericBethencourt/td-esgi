pragma solidity 0.5.16;

import "remix_tests.sol";
import "./HelloWorld.sol";


contract HelloWorldTest {
    HelloWorld helloWorld;

    function beforeAll() public {
        helloWorld = new HelloWorld();
    }

    function checkHelloWorld() public {
        string memory expected = "Hello ESGI";
        Assert.equal(helloWorld.speak(), expected, "Hello ESGI not returned");
    }
}
