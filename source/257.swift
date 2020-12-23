/*
Daily Coding Problem: Problem #257 [Easy]

This problem was asked by WhatsApp.

Given an array of integers out of order, determine the bounds of the smallest window that must be sorted in order for the entire array to be sorted. For example, given [3, 7, 5, 6, 9], you should return (1, 3).
*/



import Foundation

func findUnsortedSubarray(_ nums: [Int]) -> Int {
    var num = nums
    guard num.count > 1 else {
        return 0
    }
    num.sort()
    var start = num.count, end = 0
    for i in 0..<num.count {
        if num[i] != nums[i] {
            start = min(start, i)
            end = max(end, i)
        }
    }
    return end - start > 0 ? end - start + 1 : 0

}

// solution 2
func findUnsortedSubarray1(_ nums: [Int]) -> Int {
    var max = nums[0], idx = 0
    for i in 1..<nums.count {
        if nums[i] < max {
            idx = i-1
            break
        } else {
            max = nums[i]
        }
    }

    var min = nums[nums.count-1], idy = 0
    for i in stride(from: nums.count-2, to: 0, by: -1) {
        if nums[i] > min {
            idy = i+1
            break
        } else {
            min = nums[i]
        }
    }
//    print("sort the array from index: \(idx) to \(idy)")
    if idx == idy {
        return 0
    }
    return idy - idx + 1
}
let result = findUnsortedSubarray([2,6,4,8,10,9,15])
print(result)