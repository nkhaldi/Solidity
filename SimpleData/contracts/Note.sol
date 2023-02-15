// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Note {
  string public name;
  string public adress;
  uint number;

  function set(string memory newName, string memory newAdress, uint newNumber) public {
    name = newName;
    adress = newAdress;
    number = newNumber;
  }

  function get() public view returns (string memory, string memory, uint) {
    return (name, adress, number);
  }
}
