// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Voting {

    mapping (address => uint) internal users;
    mapping (address => bool) public isVoted;
    address[] internal address_list;

    function vote(address addr) external   {

        if (!isVoted[addr]) {  //第一次出现
            address_list.push(addr);
            isVoted[addr] = true;
            users[addr] = 1;
        }else{
            users[addr] ++ ;
        }
    
    }

    function getVotes(address addr) external view returns (uint) {
        return users[addr];
    }

    function resetVotes() external {
        for (uint i = 0; i < address_list.length;i ++ ){  //重置投票数
            users[address_list[i]]=0;
            isVoted[address_list[i]] = false ;
        }
    }


}