//
//  SingleNumberII_Bit_Solution.swift
//  SingleNumberII_Bit_Solution
//
//  Created by Paul Hsieh on 2020/12/11.
//

// This is a interesting solution, reference from:
// https://leetcode.com/problems/single-number-ii/discuss/43310/Swift-solution
// author: cl0ud_runner https://leetcode.com/cl0ud_runner/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0
        
        for num in nums {
            ones = (ones ^ num) & ~twos
            twos = (twos ^ num) & ~ones
        }
        
        return ones
    }
}

