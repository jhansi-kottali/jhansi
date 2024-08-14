// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address payable public beneficiary;
    uint public goal;
    uint public amountRaised;
    mapping(address => uint) public contributions;
    bool public fundingGoalReached;
    bool public crowdsaleClosed;

    // Event to log when a contribution is received
    event ContributionReceived(address contributor, uint amount, uint totalRaised);

    constructor(address payable _beneficiary, uint _goal) {
        beneficiary = _beneficiary;
        goal = _goal;
    }

    function contribute() public payable {
        require(!crowdsaleClosed, "Crowdsale is closed.");
        require(msg.value > 0, "Contribution must be greater than 0.");

        contributions[msg.sender] += msg.value;
        amountRaised += msg.value;

        // Emit the event to log the contribution
        emit ContributionReceived(msg.sender, msg.value, amountRaised);

        if (amountRaised >= goal) {
            fundingGoalReached = true;
        }
    }

    function checkGoalReached() public {
        require(crowdsaleClosed, "Crowdsale is not closed yet.");
        require(fundingGoalReached, "Funding goal not reached.");

        beneficiary.transfer(amountRaised);
    }

    function closeCrowdsale() public {
        require(!crowdsaleClosed, "Crowdsale is already closed.");

        crowdsaleClosed = true;
        if (amountRaised >= goal) {
            fundingGoalReached = true;
        }
    }

    function refund() public {
        require(crowdsaleClosed, "Crowdsale is not closed.");
        require(!fundingGoalReached, "Funding goal reached, no refunds available.");

        uint amount = contributions[msg.sender];
        require(amount > 0, "No contributions to refund.");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
