pragma solidity 0.5.16;

contract Electron {

  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping(uint => Candidate) public candidates;
  mapping(address => bool) public voters;
  
  uint public candidateCount = 0;
  constructor () public {
    addCandidate("Lucas Harison");
    addCandidate("Anna Harison");
  }
  
  function addCandidate (string memory _name) private {
    candidateCount++;
    candidates[candidateCount] = Candidate(candidateCount, _name, 0);
  }

  function vote(uint _candidateId) public {
    require(!voters[msg.sender]);
    require(_candidateId > 0 && _candidateId <=candidateCount);
    voters[msg.sender] = true;
    candidates[_candidateId].voteCount++;
  }
}