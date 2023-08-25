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

    mapping(uint256 => Campaign) public campaigns;
    uint256 public numberOfCampaingns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 memory _target,
        uint memory _deadline
        string memory _image
    )public returns(uint256){
        
    }
}