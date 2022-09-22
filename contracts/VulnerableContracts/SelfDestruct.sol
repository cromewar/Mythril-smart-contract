//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SelfDestruct {
    address owner;
    mapping(address => uint256) balances;

    bytes11 private backdoorpwd = "cryptocrome";
    bool private passwordentered = false;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function kill() public onlyOwner {
        selfdestruct(payable(owner));
    }

    function activateBackdoor(bytes11 _password) public {
        require(_password == backdoorpwd, "Wrong password");
        passwordentered = true;
    }

    function pwnContract() public {
        require(passwordentered == true, "Backdoor not activated");
        owner = msg.sender;
    }
}
