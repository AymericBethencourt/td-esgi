pragma solidity ^0.5.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC721/ERC721.sol";

contract MagicCards is ERC721 {
    address public owner;
    enum CreatureType {HUMAN, DEMON, ELEMENTAL, DRAGON, VAMPIRE}
    struct Card {
        string name;
        string description;
        CreatureType creatureType;
        uint256 attackPower;
        uint256 manaCost;
        uint256 pointer;
    }

    mapping(string => Card) public mapSerialToCard;
    string[] public serials;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "You are not authorized to perform this action"
        );
        _;
    }

    function isCard(string memory _serial)
        public
        view
        returns (bool _isIndeed)
    {
        if (serials.length == 0) return false;
        string memory cardSerial = serials[mapSerialToCard[_serial].pointer];
        return (keccak256(abi.encodePacked(cardSerial)) ==
            keccak256(abi.encodePacked(_serial)));
    }

    function getCardCount() public view returns (uint256 _cardCount) {
        return serials.length;
    }

    function transferCard(address _from, address _to, string memory _serial)
        public
    {
        require(bytes(_serial).length > 0, "Not a serial");
        require(isCard(_serial), "Card serial not found");
        uint256 pointer = mapSerialToCard[_serial].pointer;
        transferFrom(_from, _to, pointer);
    }

    function ownerOfCard(string memory _serial)
        public
        view
        returns (address _owner)
    {
        require(bytes(_serial).length > 0, "Not a serial");
        require(isCard(_serial), "Card serial not found");
        uint256 pointer = mapSerialToCard[_serial].pointer;
        return ownerOf(pointer);
    }

    function createCard(
        string memory _serial,
        string memory _name,
        string memory _description,
        CreatureType _creatureType,
        uint256 _attackPower,
        uint256 _manaCost
    ) public onlyOwner returns (bool _success) {
        require(bytes(_serial).length > 0, "Not a serial");
        require(!isCard(_serial), "Card serial already exists");

        uint256 pointer = serials.push(_serial) - 1;
        Card memory newCard = Card(
            _name,
            _description,
            _creatureType,
            _attackPower,
            _manaCost,
            pointer
        );
        mapSerialToCard[_serial] = newCard;
        _mint(owner, pointer);
        return true;
    }

    function getCard(string memory _serial)
        public
        view
        returns (
            string memory _name,
            string memory _description,
            CreatureType _creatureType,
            uint256 _attackPower,
            uint256 _manaCost
        )
    {
        require(bytes(_serial).length > 0, "Card ID empty");
        require(isCard(_serial), "Card serial not found");
        Card memory returnCard = mapSerialToCard[_serial];
        return (
            returnCard.name,
            returnCard.description,
            returnCard.creatureType,
            returnCard.attackPower,
            returnCard.manaCost
        );
    }

    function modifyCard(
        string memory _serial,
        string memory _name,
        string memory _description,
        CreatureType _creatureType,
        uint256 _attackPower,
        uint256 _manaCost
    ) public onlyOwner returns (bool _success) {
        require(bytes(_serial).length > 0, "Card ID empty");
        require(isCard(_serial), "Card serial not found");
        mapSerialToCard[_serial].name = _name;
        mapSerialToCard[_serial].description = _description;
        mapSerialToCard[_serial].creatureType = _creatureType;
        mapSerialToCard[_serial].attackPower = _attackPower;
        mapSerialToCard[_serial].manaCost = _manaCost;
        return true;
    }
}
