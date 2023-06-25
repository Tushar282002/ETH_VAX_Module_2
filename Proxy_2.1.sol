// SPDX-License-Identifier: MIT
// Proxy contract
pragma solidity ^0.8.0;

contract Proxy {
    address private upgradeableContract;

    constructor(address _upgradeableContract) {
        upgradeableContract = _upgradeableContract;
    }

    fallback() external payable {
        // Forward all calls to the upgradeable contract
        address target = upgradeableContract;

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), target, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
    }
}
