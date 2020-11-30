/*
This problem was asked by Apple.

Implement the function fib(n), which returns the nth number in the Fibonacci sequence, using only O(1) space.
*/

import Foundation

let sqrt_of_5 = sqrt(Double(5))
let Φ: Double = ((1 + sqrt(5.0)) / 2.0)

func fib(_ index: Int) -> Int {
  
  guard index >= 2 else {
    return index
  }
  
  let doubleIndex = Double(index)
  
  // F(n) = (Phi^n - (-Phi)^-n) / √5
  let numerator = pow(Φ, doubleIndex) - pow((-1.0 * Φ),(-1.0 * doubleIndex))
  return Int(numerator / sqrt_of_5)
}

