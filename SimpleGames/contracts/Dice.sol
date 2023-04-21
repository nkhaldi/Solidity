// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Dice {
  address public manager;
  address payable[] public players;

  function CEO() public {
    manager = msg.sender;
  }

  function Enter() public payable {
    require(msg.value > .001 ether, "The bet is too low");
    players.push(payable(msg.sender));
  }

  function getRandomNumber(uint heuristic) public view returns(uint) {
    uint randDice = (uint(block.timestamp) + heuristic) % 11 + 2;
    return(randDice);
  }

  function getWinner() public payable restricted returns(string memory, uint) {
    uint player1 = getRandomNumber(0);
    uint player2 = getRandomNumber(6);

    if (player1 > player2) {
      players[0].transfer(address(this).balance);
      return("The winner is player #1", player1);
    } else if (player2 > player1) {
      players[1].transfer(address(this).balance);
      return("The winner is player #2", player2);
    } else {
      return("Tie", player1);
    }
  }

  modifier restricted() {
    require(msg.sender == manager, "Permission denied");
    _;
  }
}
