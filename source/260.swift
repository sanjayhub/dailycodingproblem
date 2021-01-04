/*
 Daily Coding Problem: Problem #260 [Medium]


 This problem was asked by Pinterest.

 The sequence [0, 1, ..., N] has been jumbled, and the only clue you have for its order is an array representing whether each number is larger or smaller than the last. Given this information, reconstruct an array that is consistent with it. For example, given [None, +, +, -, +], you could return [1, 2, 3, 0, 4].
*/


import Foundation

func reconstruct(_ arr: [String]) -> [Int] {
    var result:[Int] = []
    let addCount = arr.filter { $0 == "+" }.count
    let first = arr.count - addCount
    result.append(first)
    var smaller = first - 1, larger = first + 1
    for i in 1..<arr.count {
        if arr[i] == "+" {
            result.append(larger)
            larger += 1
        } else {
            result.append(smaller)
            smaller -= 1
        }
    }
    return result
}

let result = reconstruct(["None", "+", "+", "-", "+"])
print(result)