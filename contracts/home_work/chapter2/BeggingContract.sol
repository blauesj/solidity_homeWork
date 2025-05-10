// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BeggingContract {

    event DonateEvent(address indexed from,uint amount);

    event WithdrawEvent(uint amount);
    
    mapping(address=>uint256) private  _donation;

    uint private _totalDonation;
    uint private _currentDonation;
    address private _owner;

    constructor(){
        _owner = msg.sender;
    }

    function donate(uint amount) payable public {
        _donation[msg.sender] += amount;
        _totalDonation += amount;
        _currentDonation += amount;
        emit DonateEvent(msg.sender, amount);
    }

    function withdraw() public {
        require(msg.sender == _owner,"no permission to withdraw");
        payable(msg.sender).transfer(_currentDonation);
        _currentDonation = 0;
        emit WithdrawEvent(_currentDonation);
    }

    function getDonation(address _addr) public view  returns(uint){
        return _donation[_addr];
    }

    receive() external payable {

    }


}