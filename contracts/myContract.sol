// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract myContract{
    // string public data;
    //  function set(string memory _data) public{
    //    data=_data;
    //    //mapping 
    //  } 

     
    uint public fee;
 
    address payable public receiver;
    // we can access the sender just by msg.sender

    mapping (address => uint) public balances;
   
    event Sent(address from, address payable to, uint price, bool sent);

    constructor(address payable _receiver, uint _fee) public {
        receiver = _receiver;
        fee = _fee;
    }
// address of reciever 
    function getReceiverBalance() public view returns(uint) {
        return receiver.balance;
    }
// address of sender 
    function getSenderBalance() public view returns(uint) {
        return msg.sender.balance;
    }

    function sendTrx() public payable {
        uint value = msg.value * fee / 100;
        bool sent = receiver.send(value);
        balances[receiver] += (value);
        emit Sent(msg.sender, receiver, value, sent);
    }
//msg.sender is always the address where the current (external) function call came from.
//msg.value — The amount of wei sent with a message to a contract (wei is a denomination of ETH)->price in our case  


}




