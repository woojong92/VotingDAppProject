pragma solidity ^0.5.0;

import "./safemath.sol";
import "./ownable.sol";

contract Voting{
    
    struct Candidate{
        string name;
        uint32 count;
    }
    
    event NewCandidate(uint candidateId, string name);
    
    Candidate[] public candidates;

    mapping (uint => address) public candidateToOwner;
    mapping (address => uint) ownerCandidateCount;

    function createCandidate(string memory _name) public {
        uint id = candidates.push(Candidate(_name, 0)) -1;
        candidateToOwner[id] = msg.sender;
        ownerCandidateCount[msg.sender]++;
        emit NewCandidate(id, _name);
    } 
    
    function voteForCandidate(uint _candidateId) public {
        candidates[_candidateId].count += 1;
    }
    
    function totalVotesFor(uint _candidateId) view public returns(uint32){
        return candidates[_candidateId].count;
    }
    
    /*
    function validCandidate(string memory _candidate) view public returns(bool){
        for(uint i=0; i < candidates.length; i++ ){
            if( candidates[i].name == _candidate) {
                return true;
            }
        }
        return false;
    }
    */
    
}