// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Factorial {
  function getFactorial(uint n) public pure returns (uint256) {
    uint f = 1;
    for (uint i = 1; i <= n; i++) f *= i;
    return f;
  }
}
