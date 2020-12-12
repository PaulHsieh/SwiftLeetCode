//
//  ClimbingStairs.swift
//  ClimbingStairs
//
//  Created by Paul Hsieh on 2020/12/12.
//

// Actually, this is Fibonacci soultion, but only recursive soultion not efficienct enough,
// so that we can use hash map to sotre the existed solution then we can hash the result more efficiently.
// The result of recursive only soultion will not pass on LeetCode due to "Time Limit Exceeded"

class Solution {
    var sameResult: [Int: Int] = [1:1, 2:2]
    func climbStairs(_ n: Int) -> Int {
        if n < 1 {
            return 0
        }
        
        if let result = sameResult[n] {
            return result
        } else {
            let p = climbStairs(n - 1) + climbStairs(n - 2)
            sameResult[n] = p
            return p
        }
    }
}
