// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Owner {
  address owner;
  constructor() {
    owner = msg.sender;
  }

  struct user {
    string name;
    uint number;
    uint age;
  }
  mapping (string => user) public users;

  function setUser(string memory name, uint number, uint age) public {
    require(msg.sender == owner, "Not owner");
    users[name] = user(name, number, age);
  }

  function getUser(string memory name) public view returns (uint, uint) {
    require(msg.sender == owner, "Not owner");
    return (users[name].number, users[name].age);
  }
}
