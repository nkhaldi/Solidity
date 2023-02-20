// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Address {
  uint length = 0;
  mapping (uint => address) addresses;

  function set(address userAddress) public {
    addresses[length] = userAddress;
    length++;
  }

  function get(address userAddress) public view returns (uint) {
    for (uint i = 0; i <= length; i++) {
      if (addresses[i] == userAddress) {
        return i;
      }
    }
    return length + 1;
  }

  function getAll() public view returns (address[] memory) {
    address[] memory all = new address[](length);
    for (uint i = 0; i < length; i++) {
      all[i] = addresses[i];
    }
    return all;
  }
}
