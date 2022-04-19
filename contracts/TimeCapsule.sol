// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TimeCapsule {
    address payable owner;
    uint256 withdrawTime;

    constructor() payable {
        owner = payable(msg.sender);
        withdrawTime = block.timestamp + 365 days;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    fallback() external payable {}

    receive() external payable {}

    function destroyCapsule() public payable {
        require(msg.sender == owner);
        require(block.timestamp > withdrawTime);
        selfdestruct(owner);
    }
}
