pragma solidity 0.5.12;

contract SimpleStorage {
    uint256 public storedData;

    constructor(uint256 x) public {
        storedData = x;
    }

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256 retVal) {
        return storedData;
    }
}
