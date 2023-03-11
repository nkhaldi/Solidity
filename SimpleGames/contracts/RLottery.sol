// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RLottery {
  uint maxNum = 50;
  struct player {
    uint ticket;
  }

  mapping (uint => player) public players;

  function getTicket() public payable returns(string memory, uint) {
    uint newTicket;
    do {
      newTicket = block.timestamp % maxNum;
    } while (newTicket == 0 || players[newTicket].ticket > 0);

    players[newTicket] = player(newTicket);
    return("Your ticket", newTicket);
  }

  function winner() public view returns(string memory, uint) {
    uint winTicket;
    do {
      winTicket = block.timestamp % maxNum;
    } while (winTicket == 0 || players[winTicket].ticket == 0);

    return("Winner", winTicket);
  }
}
