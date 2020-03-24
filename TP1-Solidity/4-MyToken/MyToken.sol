pragma solidity 0.5.16;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) public {
        balanceOf[msg.sender] = _totalSupply;
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Your balance is too low");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        return true;
    }
}
