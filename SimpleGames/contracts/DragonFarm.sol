// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract DragonFarm {
  struct Dragon {
    string name;
    uint dna;
  }

  Dragon[] public dragons;

  event NewDragon(string name, uint dna);

  function GenerateRandomDna(string memory _str) private pure returns (uint) {
    uint rand = uint(keccak256((abi.encode(_str))));
    return rand % (10 ** 16);
  }

  function AddDragon(string memory _name, uint _dna) private {
    dragons.push(Dragon(_name, _dna));
    emit NewDragon(_name, _dna);
  }

  function CreateDragon(string memory _name) public {
    uint randDna = GenerateRandomDna(_name);
    AddDragon(_name, randDna);
  }
}