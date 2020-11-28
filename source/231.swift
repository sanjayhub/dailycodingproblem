/*
This problem was asked by IBM.

Given a string with repeated characters, rearrange the string so that no two adjacent characters are the same. If this is not possible, return None.

For example, given "aaabbc", you could return "ababac". Given "aaab", return None.
 
 https://leetcode.com/problems/reorganize-string/
 Example 1:
 Input: S = "aab"
 Output: "aba"
 
 Example 2:
 Input: S = "aaab"
 Output: ""
 
 S will consist of lowercase letters and have length in range [1, 500].
Eample, given "aaabbc", you could return "ababac". Given "aaab", return None.
*/


import Foundation

func reorganizeString(_ S: String) -> String {
    var dict: [Character: Int] = [:]
    let S = Array(S)
    let n = S.count
    
    var maxCount = 0
    var maxChar: Character = " "
    for c in S {
        dict[c, default: 0] += 1
        if dict[c]! > maxCount {
            maxCount = dict[c]!
            maxChar = c
        }
        // If maxCount exceeds half of the string size, that means we can't arrange the letters as asked.
        guard dict[c]! <= (n + 1) / 2 else { return "" }
    }
    var result:[Character] = Array(repeating: " ", count: n)
    
    var i = 0
    for _ in 0..<maxCount {
        result[i] = maxChar
        i += 2
    }
    
    dict.removeValue(forKey: maxChar)
    dict.forEach { (k,v) in
        for _ in 1...v {
            if i >= n {
                i = 1
            }
            result[i] = k
            i += 2
        }
    }
    return String(result)
}
let result = reorganizeString("aaabbc")
print("result:\(result)")