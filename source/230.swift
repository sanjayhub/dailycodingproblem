/* This problem was asked by Goldman Sachs.

You are given N identical eggs and access to a building with k floors. Your task is to find the lowest floor that will cause an egg to break, if dropped from that floor. Once an egg breaks, it cannot be dropped again. If an egg breaks when dropped from the xth floor, you can assume it will also break when dropped from any floor greater than x.

Write an algorithm that finds the minimum number of trial drops it will take, in the worst case, to identify this floor.

For example, if N = 1 and k = 5, we will need to try dropping the egg at every floor, beginning with the first, until we reach the fifth floor, so our solution will be 5.

*/

solution 1 : DP 
func superEggDrop(_ K: Int, _ N: Int) -> Int {
    if N == 0 || N == 1 {
        return N
    }
    if K == 1 {
        return N
    }
    let M = 300
    var dp = Array(repeating: Array(repeating: 0, count: K+1), count: M)
    
    for i in 1..<M+1 {
        for j in 1..<K+1 {
            dp[i][j] = 1 + dp[i-1][j] + dp[i-1][j-1]
            if dp[i][j] >= N {
                return i
            }
        }
    }
    return N
}

solution 2 : Binary search 

var n = 0
var dp: [[Int]]!
func superEggDrop(_ K: Int, _ N: Int) -> Int {
    n = N
    dp = [[Int]](repeating: [Int](repeating: -1, count: K+1), count: N+1)
    let res = dfs(N, K)
    return res
}

func dfs(_ floor: Int, _ egg: Int) -> Int {
    guard egg > 1 else {
        return floor
    }
    guard floor > 1 else {
        return 1
    }
    guard dp[floor][egg] == -1 else {
        return dp[floor][egg]
    }
    var res = Int.max
    var low = 1, high = floor
    while low <= high {
        let mid = low + (high-low)/2
        let left = dfs(mid-1, egg-1)
        let right = dfs(floor-mid, egg)
        let cur = 1 + max(left, right)
        if left > right {
            high = mid - 1
        } else {
            low = mid + 1
        }
        res = min(res, cur)
    }
    
    dp[floor][egg] = res
    return res
}