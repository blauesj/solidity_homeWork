// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract question_5{
    
    function mergeArray(uint8[] calldata arr1,uint8[] calldata arr2) external pure returns (uint8[] memory){
        uint8[]memory arr = new uint8[](arr1.length+arr2.length);
        uint i = 0;
        uint j = 0;
        for (;;){
            if (i<arr1.length && j<arr2.length){
                if (arr1[i]<arr2[j]){
                    arr[i+j] = arr1[i];
                    i++;
                }else{
                    arr[i+j] = arr2[j];
                    j++;
                }
            }
            if (arr1.length == i){
                for (;j<arr2.length;){
                    arr[i+j] = arr2[j];
                    j++;
                }
                break ;
            }
            if (arr2.length == j) {
                for (;i<arr1.length;){
                    arr[i+j] = arr1[i];
                    i++;
                }
                break ;
            }

        }
        return arr;
    }

    function findNum(uint8[] calldata arr,uint8 _num) public pure returns (int){
        uint i=0;
        uint j=arr.length-1;
        uint m;
        while (i <= j){
            m = uint(i+j)/2;
            if (arr[m]<_num){
                i = m +1;
            }else if(arr[m]>_num){
                j = m-1;
            }else{
                return int(m);
            }
        }
        return -1;

    }
        
}