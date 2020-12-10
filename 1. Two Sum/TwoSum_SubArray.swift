//
//  TwoSum_SubArray.swift
//  TwoSum_SubArray
//
//  Created by Paul Hsieh on 2020/12/10.
//

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (index, element) in nums.enumerated() {
            if let findIndex = nums.suffix(nums.count - (index + 1)).firstIndex(of: target - element) {
                return [index, findIndex]
            }
        }
        
        return []
    }
}

