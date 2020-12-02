/*
This problem was asked by Facebook.

Given an array of numbers of length N, find both the minimum and maximum using less than 2 * (N - 2) comparisons.
 https://afteracademy.com/blog/find-the-minimum-and-maximum-value
*/

import Foundation

//solution 1 : linear searching
func findmaxmin(_ arr:[Int]) {
    var max = arr[0], min = arr[0]
    for i in 1..<arr.count-1 {
        if arr[i] > max {
            max = arr[i]
        } else if arr[i] < min {
            min = arr[i]
        }
    }
   print(min,max)
}

// in each step of loop, we are making two comparisions in worst case. so no.of comparisions is 2 * (n - 1) = 2n - 2
findmaxmin([4, 2, 0, 8, 20, 9, 2])


//solution 2 : in pairs
func minmax(_ a:[Int]) {
    var max:Int, min: Int, i:Int
    if a.count % 2 != 0 {
        max = a[0]; min = a[0]
        i = 1
    } else {
        if a[0] < a[1] {
            min = a[0]; max = a[1]
        } else {
            min = a[1]; max = a[0]
        }
        i = 2
    }
    while i < a.count {
        if a[i] < a[i+1] {
            if a[i] < min {
                min = a[i]
            }
            if a[i+1] > max {
                max = a[i+1]
            }
                
        } else {
            if a[i+1] > max {
                max = a[i+1]
            }
            if a[i+1] < min {
                min = a[i+1]
            }
        }
        i += 2
    }
    print(min,max)
}

minmax([4, 2, 0, 8, 20, 9, 2])

/*
 time complexity is O(n) and space complexity is O(1)
 number of comparisions
 If n is odd, 3 * (n-1) / 2
 If n is even, 1 + 3*(n-2)/2 = 3n/2-2
 */
