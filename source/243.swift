
/*
 Daily Coding Problem: Problem #243 [Medium]
 
 This problem was asked by Etsy.

 Given an array of numbers N and an integer k, your task is to split N into k partitions such that the maximum sum of any partition is minimized. Return this sum.

 For example, given N = [5, 1, 2, 7, 3, 4] and k = 3, you should return 8, since the optimal partition is [5, 1, 2], [7], [3, 4].
 
 https://leetcode.com/problems/subarray-sum-equals-k/
 */

import Foundation

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    
    guard nums.count > 0 else {
        return 0
    }
    var map = [Int:Int]()
    map[0] = 1
    var res = 0, curSum = 0
    for i in 0..<nums.count {
        curSum += nums[i]
        if let count = map[curSum - k] {
            res += count
        }
        map[curSum] = (map[curSum] ?? 0) + 1
        print(map)
    }
    
    return res
}

let result = subarraySum([1,2,3],3)
print(result)



