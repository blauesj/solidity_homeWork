// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Question3 {

    mapping (bytes1 => int) internal dic;

    constructor(){
        dic["I"]=1;
        dic["V"]=5;
        dic["X"]=10;
        dic["L"]=50;
        dic["C"]=100;
        dic["D"]=500;
        dic["M"]=1000;
    
    }
 
    //MCMXCIV   20647
    function romanToInt(string memory _s) public view returns (int){
        bytes memory s = bytes(_s);
        int res = 0;
        for(uint i=0;i<s.length-1;i++ ){
            if (dic[s[i]]<dic[s[i+1]]){
                res -=dic[s[i]];
            }else{
                res += dic[s[i]];
            }
        }
        res += dic[s[s.length-1]];
        return res;
    }

    function getNum(bytes1 c) internal pure returns (int){
        if (c == "I"){
            return 1;
        }
        if (c == "V"){
            return 5;
        }
        if (c == "X"){
            return 10;
        }
         if (c == "L"){
            return 50;
        }
        if (c == "C"){
            return 100;
        }
        if (c == "D"){
            return 500;
        }
        return 1000;
        
    }

    //MCMXCIV    10328
    function romanToInt1(string memory _s) public pure  returns (int){
        bytes memory s = bytes(_s);
        int res = 0;
        for(uint i=0;i<s.length-1;i++ ){
            if (getNum(s[i])<getNum(s[i+1])){
                res -=getNum(s[i]);
            }else{
                res += getNum(s[i]);
            }
        }
        res += getNum(s[s.length-1]);
        return res;
    }


    function intToRoman(uint _num) public pure returns (string memory){
        string memory res;
        string memory t;
        while (_num>0 ){
            (t,_num) = getRom(_num);
            res = string.concat(res,t);
        }
        return res;
    }

    function getRom(uint num) internal pure returns (string memory,uint){
        if (num>1000){
            num -= 1000;
            return ("M" ,num);
        }
        else if(num>=900)
    {
        num -= 900;
        return ("CM",num);
    }
    else if(num>=500)
    {
        num -= 500;
        return ("D",num);
    }
    else if(num>=400)
    {
        num -= 400;
        return ("CD",num);
    }
    else if(num >=100)
    {
        num -= 100;
        return ("C",num);
    }
    else if(num>=90)
    {
        num -= 90;
        return ("XC",num);
    }
    else if(num>=50)
    {
        num -= 50;
        return ("L",num);
    }
    else if(num >=40)
    {
        num-= 40;
        return ("XL",num);
    }
    else if(num>=10)
    {
        num -= 10;
        return ("X",num);
    }
    else if(num>=9)
    {
        num -= 9;
        return ("IX",num);
    }
    else if(num>=5)
    {
        num -= 5;
        return ("V",num);
    }
    else if(num>=4)
    {
        num -= 4;
        return ("IV",num);
    }
    else
    {
        num-=1;
        return ("I",num);
    }
    }


}