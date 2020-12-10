//
//  TwoSum_HashMap.swift
//  TwoSum_HashMap
//
//  Created by Paul Hsieh on 2020/12/10.
//


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]
        for (index, element) in nums.enumerated() {
            let difference = target - element
            if let dicIndex = dic[difference] {
                return [dicIndex, index]
            } else {
                dic[element] = index
            }
        }
        
        return []
    }
}

