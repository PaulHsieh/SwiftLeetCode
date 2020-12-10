//
//  SingleNumber_Bit_Manipulation_solution.swift
//  SingleNumber_Bit_Manipulation_solution
//
//  Created by Paul Hsieh on 2020/12/11.
//

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for element in nums {
            result ^= element
        }
        return result
    }
}

