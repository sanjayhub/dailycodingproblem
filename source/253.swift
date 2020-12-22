/*
 Daily Coding Problem: Problem #253 [Medium]

 This problem was asked by PayPal.

 Given a string and a number of lines k, print the string in zigzag form. In zigzag, characters are printed out diagonally from top left to bottom right until reaching the kth line, then back up to top right, and so on.

 For example, given the sentence "thisisazigzag" and k = 4, you should print:

 t     a     g
  h   s z   a
   i i   i z
    s     g
 
 https://leetcode.com/problems/zigzag-conversion/
 */

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows>1 else {
        return s
    }
    let strs = Array(s)
    var result = [String](repeating: "", count: numRows)
    
    var i = 0
    while i < strs.count {
        for idx in stride(from: 0, to: numRows, by: 1) where i < strs.count {
            result[idx].append(strs[i])
            i += 1
        }
        for idx in stride(from: numRows-2, through: 1, by: -1) where i < strs.count {
            result[idx].append(strs[i])
            i += 1
        }
    }
    return result.joined()
}


func convert1(_ s: String, _ numRows: Int) -> String {
    
    if s.count<=numRows || numRows == 1 {
        return s
    }
    
    var curRow = 0
    var goDown = true
    var ans: [String] = Array(repeating: "", count: numRows)
    //instead of using char array, use string to avoid multidimentional array
    
    for c in s {
        ans[curRow].append(c)
        if goDown{
            curRow+=1
        }else {
            curRow-=1
        }
        if(curRow == numRows-1 || curRow == 0){
            goDown = !goDown       //change direction if touches top or bottom
        }
    }
    
    var output = ""
    ans.forEach{w in
        output+=w
    }
    return output
    
}
let result = convert1("PAYPALISHIRING",3)
print(result)