// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Voter {
  struct Candidate {
    uint id;
    string name;
    uint votes;
  }

  uint private length = 1;
  mapping (address => bool) private voters;
  mapping (uint => Candidate) private candidates;

  event votedEvent (uint indexed candidateId);

  function addCandidate(string memory newCandidate) public {
    candidates[length] = Candidate(length, newCandidate, 0);
    length++;
  }

  function Vote(uint candidateId) public {
    require(!voters[msg.sender], "You have already voted");
    require(candidateId > 0 && candidateId < length, "Invalid candidate id");
    voters[msg.sender] = true;
    candidates[candidateId].votes++;
    emit votedEvent(candidateId);
  }

  function getWinner() public view returns (uint, string memory, uint) {
    uint winner;
    for (uint id = 0; id < length; id++) {
      if (candidates[id].votes > candidates[winner].votes) {
        winner = id;
      }
    }
    return (candidates[winner].id, candidates[winner].name, candidates[winner].votes);
  }
}
