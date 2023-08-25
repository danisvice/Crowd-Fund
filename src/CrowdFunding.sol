// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract crowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        unt256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    
}