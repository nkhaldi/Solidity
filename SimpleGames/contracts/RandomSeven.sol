// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RandomSeven {
  function Random(uint x) public view returns(string memory) {
    uint rand = x * block.timestamp / block.number;
    while (rand > 0) {
      uint digit = rand % 10;
      if (digit == 7)
        return ("Winner");
      rand /= 10;
    }
    return ("Looser");
  }
}
