pragma solidity 0.6.1;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value >= 10000000000000000, "Miniumun amount not met");
        players.push(msg.sender);
    }

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(abi.encodePacked(block.difficulty, now, players))
            );
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function pickWinner() public restricted {
        uint256 index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable[](0);
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
