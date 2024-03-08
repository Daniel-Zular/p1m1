
pragma solidity ^0.8.0;

contract SafeRemotePurchase {
    uint public value;
    address payable public seller;
    address payable public buyer;
    enum State { Created, Locked, Release, Inactive }
    State public state;

    constructor() payable {
        seller = payable(msg.sender);
        value = msg.value / 2;
        require((2 * value) == msg.value, "Value has to be even.");
    }

    modifier condition(bool condition_) {
        require(condition_);
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this.");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    modifier inState(State state_) {
        require(state == state_, "Invalid state.");
        _;
    }

    // Omitting further logic for brevity
}
