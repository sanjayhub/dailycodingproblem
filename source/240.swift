/*
 Daily Coding Problem: Problem #240 [Hard]
 
 This problem was asked by Spotify.

 There are N couples sitting in a row of length 2 * N. They are currently ordered randomly, but would like to rearrange themselves so that each couple's partners can sit side by side.

 What is the minimum number of swaps necessary for this to happen?
 
 https://leetcode.com/problems/couples-holding-hands/
 */

import Foundation

func minSwapsCouples(_ row: [Int]) -> Int {
    var row = row
    var couples = Dictionary(uniqueKeysWithValues: row.enumerated().map { ($1, $0) })

    var swaps = 0
    print(couples)
    for i in stride(from: 0, to: row.count, by: 2) {
        let person = row[i]
        let partner = person ^ 1
        if row[i + 1] != partner {
            swaps += 1
            let partnerIndex = couples[partner, default: 0]
            row.swapAt(i + 1, partnerIndex)
            couples[row[partnerIndex]] = partnerIndex
        }
    }
    return swaps
}

let result = minSwapsCouples([2,0,1,3])