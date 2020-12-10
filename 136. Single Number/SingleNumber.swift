//
//  SingleNumber.swift
//  SingleNumber
//
//  Created by Paul Hsieh on 2020/12/11.
//

class Solution {
    var uniqueSet: Set<Int> = Set()
    func singleNumber(_ nums: [Int]) -> Int {
        for element in nums {
            if uniqueSet.contains(element) {
                uniqueSet.remove(element)
            } else {
                uniqueSet.insert(element)
            }
        }
        
        return uniqueSet.first!
    }
}

