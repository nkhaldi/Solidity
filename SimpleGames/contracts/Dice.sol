// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Dice {
  function getRandomNumber(uint heuristic) public view returns(uint) {
    uint randDice = (uint(block.timestamp) + heuristic) % 11 + 2;
    return(randDice);
  }
  function getWinner() public view returns(string memory, uint) {
    uint player1 = getRandomNumber(0);
    uint player2 = getRandomNumber(6);

    if (player1 > player2) {
      return("The winner is player #1", player1);
    } else if (player2 > player1) {
      return("The winner is player #2", player2);
    } else {
      return("Tie", player1);
    }
  }
}
