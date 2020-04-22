pragma solidity 0.5.16;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC721/ERC721.sol";


contract MyGame is ERC721 {
    struct Item {
        string name;
        uint256 level;
        uint256 rarity;
    }

    Item[] public items;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function createItem(string memory _name, address _to) public {
        require(owner == msg.sender, "You are not the owner");
        uint256 id = items.length;
        items.push(Item(_name, 5, 1));
        _mint(_to, id);
    }

    function transferItem(address _from, address _to, uint256 _id) public {
        require(items.length >= _id, "ID not available");
        transferFrom(_from, _to, _id);
    }
}
