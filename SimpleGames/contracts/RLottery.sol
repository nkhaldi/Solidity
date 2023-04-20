// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RLottery {
  uint current = 1;
  uint maxTickets = 42;
  struct player {
    uint ticket;
  }

  mapping (uint => player) public players;

  function getTicket() public payable returns(uint) {
    require(current < maxTickets, "SOLD OUT");
    uint ticket = current++;
    players[ticket] = player(ticket);
    return(ticket);
  }

  function getWinner() public view returns(uint) {
     //uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, maxTickets))) % 9;
    uint winner = uint(block.timestamp) % maxTickets + 1;
    return(winner);
  }
}
