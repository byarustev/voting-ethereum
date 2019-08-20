pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Voter{
    string[] options;
    uint[] votes;
    struct OptionPos{
        uint pos;
        bool exists;
    }

    mapping(address=>bool) hasVoted;
    mapping(string=>OptionPos) posOfOption;
    
    constructor (string[] memory _options ) public{
        options = _options;
        votes.length = options.length;
        
        //filling the mapping
        for (uint i=0; i<options.length; i++){
            OptionPos memory tempOptPos = OptionPos(i,true);
            string memory optionName=options[i];
            posOfOption[optionName]=tempOptPos;
        }
        
    }

    function vote(uint option) public {
        require(0<=option && option<options.length, "invalid vote");
        require(!hasVoted[msg.sender],"you have already voted");
        votes[option] = votes[option]+1;
        hasVoted[msg.sender]=true;
    }

    function vote(string memory posName) public{
        require(!hasVoted[msg.sender],"you have already voted");
        OptionPos memory tempOptPos= posOfOption[posName];
        require(tempOptPos.exists,"option does not exist");
        votes[tempOptPos.pos] = votes[tempOptPos.pos]+1;
        hasVoted[msg.sender]=true;
    }

    function getOptions() public view returns (string[] memory){
        return options;
    }

    function getVotes() public view returns (uint[] memory){
        return votes;
    }
}
