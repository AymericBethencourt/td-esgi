pragma solidity 0.5.12;

contract Lottery {
    address payable[] public players;

    function enter() public payable {
        require(msg.value >= 1 ether, "Miniumun amount not met");
        players.push(msg.sender);
    }

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(abi.encodePacked(block.difficulty, now, players))
            );
    }

    function pickWinner() public {
        uint256 index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable[](0);
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
