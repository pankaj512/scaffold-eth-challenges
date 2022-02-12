// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;  //Do not change the solidity version as it negativly impacts submission grading

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(
            exampleExternalContractAddress
        );
        DEADLINE = block.timestamp + 3 days;
    }

    modifier notCompleted() {
        require(!exampleExternalContract.completed(), "Staking Completed");
        _;
    }

    // Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
    //  ( make sure to add a `Stake(address,uint256)` event and emit it for the frontend <List/> display )
    mapping(address => uint256) private balances;
    uint256 private immutable DEADLINE;
    uint256 public constant threshold = 1 ether;
    bool private openForWithdraw = false;
    bool private openForExecute = true;

    event Stake(address, uint256);

    // not allow staking if threshold met
    function stake() public payable notCompleted {
        // anyone can stake fund so no check require for caller but staker should not be 0 address either
        // staking amount should be greater then 0 and
        require(msg.sender != address(0), "Zero address!");
        require(msg.value > 0, "staking amount should be greater then zero");
        require(
            block.timestamp < DEADLINE,
            "Staking ends, better luck next time"
        );

        // store the stake of caller into balances
        balances[msg.sender] += msg.value;
        emit Stake(msg.sender, msg.value);
    }

    // After some `deadline` allow anyone to call an `execute()` function
    //  It should either call `exampleExternalContract.complete{value: address(this).balance}()` to send all the value
    // if the `threshold` was not met, allow everyone to call a `withdraw()` function
    function execute() public {
        require(block.timestamp > DEADLINE, "Can't execute before deadline");
        require(openForExecute, "Already excuted!!");
        if (address(this).balance < threshold) openForWithdraw = true;
        else exampleExternalContract.complete{value: address(this).balance}();
        openForExecute = false;
    }

    // Add a `withdraw(address payable)` function lets users withdraw their balance
    function withdraw(address payable _account) public {
        require(openForWithdraw, "Withdrawal not open yet or executed!!");
        uint256 balance = balances[address(_account)];
        require(balance > 0, "Not a contributer!!");

        (bool sent, ) = _account.call{value: balance}("");
        require(sent, "Withdrawal failed!!");
        balances[address(_account)] = 0;
    }

    // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
    function timeLeft() public view returns (uint256 o_deadline) {
        o_deadline = block.timestamp < DEADLINE
            ? DEADLINE - block.timestamp
            : 0;
    }

    // Add the `receive()` special function that receives eth and calls stake()
    receive() external payable {
        stake();
    }
}