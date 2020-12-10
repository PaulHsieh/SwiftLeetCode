//
//  TwoSumII- InputArrayIsSorted.swift
//  TwoSumII- InputArrayIsSorted
//
//  Created by Paul Hsieh on 2020/12/10.
//


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var startIndex = 0
        var endIndex = nums.count - 1
        while (startIndex < endIndex) {
            let sum = nums[startIndex] + nums[endIndex]
            if sum == target {
                return [startIndex + 1, endIndex + 1]
            }
            
            if sum > target {
                endIndex -= 1
            } else {
                startIndex += 1
            }
        }
        
        return[]
    }
}

