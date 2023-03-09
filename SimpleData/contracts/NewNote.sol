// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract NewNote {
  struct user {
    string name;
    string adress;
    uint number;
  }

  mapping (string => user) public users;

  function setUser(string memory name, string memory adress, uint number) public {
    users[name] = user(name, adress, number);
  }

  function getUser(string memory name) public view returns (string memory, uint) {
    return (users[name].adress, users[name].number);
  }
}
