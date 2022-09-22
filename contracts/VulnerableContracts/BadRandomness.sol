//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BadRandomness {
    address payable[] private users;

    function participate() external payable {
        require(msg.value == 1 ether);
        users.push(payable(msg.sender));
    }

    function pickRandomUser() external {
        uint256 randomWinnerIndex = uint256(
            keccak256(abi.encodePacked(block.difficulty, msg.sender))
        );
        address winner = users[randomWinnerIndex % users.length];
        (bool success, ) = winner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}
