// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract SendEther {
    constructor() payable {

    }

    receive() external payable { }


    function tracfer(address payable _to) external payable { 
        _to.transfer(123 wei);
    }

    function send(address payable  _to) external payable {
        bool s =_to.send(msg.value);
        require(s,"send failed");
    }

    function call(address payable _to) external payable  {
        (bool s,) = _to.call{value:222}("");
        require(s,"call failed");
    }


}

contract Receive {
    event Log(string msg, address addr, uint value,uint blance);

    receive() external payable {
        emit Log("receive",msg.sender,msg.value,gasleft());
     }

     fallback() external payable{
        emit Log("fallback",msg.sender,msg.value,gasleft());
     }

     function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}