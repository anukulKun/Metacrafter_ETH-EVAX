// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HandleMe {

    uint256 public balance;

    // Constructor to set the initial balance
    constructor(uint256 _initialBalance) {
        balance = _initialBalance;
    }

    // require()

    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount should be greater than 0");
        balance += amount;
    }

    //assert()

    function withdraw(uint256 amount) public {
        uint256 newBalance = balance - amount;
        assert(newBalance <= balance); // check internal state 
        
        if (newBalance < 0) {
            revert("Insufficient balance");
        }

        balance = newBalance;
    }

    //revert()
    function resetBalance(uint256 newBalance) public {
        if (newBalance < 0) {
            revert("New balance must be non-negative");
        }
        balance = newBalance;
    }
}
