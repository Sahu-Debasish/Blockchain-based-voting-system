// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // Structure to represent a candidate
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Array of candidates
    Candidate[] public candidates;

    // Mapping to store voter balances
    mapping(address => bool) public voters;

    // Function to add a new candidate
    function addCandidate(string memory _name) public {
        candidates.push(Candidate(_name, 0));
    }

    // Function to cast a vote for a candidate
    function vote(uint256 _candidateIndex) public {
        require(_candidateIndex < candidates.length, "Invalid candidate index");
        require(!voters[msg.sender], "You have already voted");

        voters[msg.sender] = true;
        candidates[_candidateIndex].voteCount++;
    }

    // Function to get the total number of candidates
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    // Function to get candidate details by index
    function getCandidate(uint256 _index) public view returns (string memory, uint256) {
        require(_index < candidates.length, "Invalid candidate index");
        return (candidates[_index].name, candidates[_index].voteCount);
    }
}
