// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageAndMemoryContract {
    uint public storedData;  // Storage variable
    function modifyStorageData(uint256 newData) public {
        storedData = newData;
    }
    function readStorageData() public view returns (uint) {
        return storedData;
    }
    
    function modifyMemoryData(uint256 newData) public pure returns (uint) {
        uint memoryData = newData;  // Memory variable
        memoryData += 10;
        return memoryData;
    }
}
