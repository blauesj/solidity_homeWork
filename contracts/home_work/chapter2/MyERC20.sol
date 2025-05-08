// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;



contract My_ERC20{

    event TranceEvent(address indexed from,address indexed to,uint amount);
    event ApprovalEvent(address indexed owner,address indexed target,uint amount);

    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    address private owner;

    uint256 private _totalSupply;

    constructor(){
        owner = msg.sender;
    }

    function balanceOf(address account) public view returns (uint256){

        return _balances[account];
    }

    function transfer(address to,uint amount) public returns (bool){
        require(_balances[msg.sender] >=amount,"balance is insufficient");
        require(to != address(0),"no valid recipient");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit TranceEvent(msg.sender, to, amount);
        return true;
    }

    function transferFrom(address from,address to,uint amount) public returns (bool success ){

        require(_balances[from] >=amount,"balance is insufficient");
        require(to != address(0),"no valid recipient");
        require(msg.sender==from || _allowances[from][msg.sender] >=amount,"spend is insufficient");
    
        _balances[from] -= amount;
        _balances[to] += amount;
        emit TranceEvent(from, to, amount);
        return true;
    }

    function approve(address target,uint amount) public returns (bool){
        _allowances[msg.sender][target] = amount;
        emit ApprovalEvent(msg.sender, target, amount);
        return true;
    }

    function mint(address account,uint amount) public{
        require(msg.sender == owner,"only owner can mint");
        _totalSupply+=amount;
        _balances[account] +=amount;
    }

}