// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Reverse {


    function revertStr(string memory str) public pure returns (string memory){   
        bytes memory temps = bytes(str);
        uint length = temps.length;
        
        for(uint i = 0;i<length/2;i++){
            (temps[i],temps[length-1-i]) = (temps[length-1-i],temps[i]);
        }
        return string(temps);
    } 


    function revertStr2(string memory str) public pure returns (string memory){   
        bytes memory temps = bytes(str);
        uint length = temps.length;
        bytes memory reversed = new bytes(length);

        for(uint i = 0;i<length;i++){
            reversed[i] = temps[length -1 - i];
        }
        return string(reversed);
    } 
}