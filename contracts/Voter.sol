pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Voter{
    string[] options;
    uint[] votes;

    constructor (string[] _options ) public{
        options = _options;
        votes.length = options.length;
    }

    function vote(uint option) public {
        require(0<=option && option<options.length, "invalid vote");
        votes[option] = votes[option]+1;
    }

    function getOptions() public view returns (string[] memory){
        return options;
    }

    function getVotes() public view returns (uint[] memory){
        return votes;
    }
}
