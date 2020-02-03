pragma solidity 0.5.12;

contract Courses {
    struct Instructor {
        uint256 age;
        string fName;
        string lName;
    }

    mapping(address => Instructor) instructors;
    address[] public instructorAccts;

    function setInstructor(
        address _address,
        uint256 _age,
        string memory _fName,
        string memory _lName
    ) public {
        Instructor memory instructor = instructors[_address];

        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;

        instructorAccts.push(_address) - 1;
    }

    function getInstructors() public view returns (address[] memory) {
        return instructorAccts;
    }

    function getInstructor(address _address)
        public
        view
        returns (uint256, string memory, string memory)
    {
        return (
            instructors[_address].age,
            instructors[_address].fName,
            instructors[_address].lName
        );
    }

    function countInstructors() public view returns (uint256) {
        return instructorAccts.length;
    }

}
