//
//  SingleNumberII.swift
//  SingleNumberII
//
//  Created by Paul Hsieh on 2020/12/11.
//

class Solution {
    var uniqueSet: Set<Int> = []
    var repeatSet: Set<Int> = []
    func singleNumber(_ nums: [Int]) -> Int {
        for element in nums {
            if !uniqueSet.contains(element), !repeatSet.contains(element) {
                uniqueSet.insert(element)
            } else if uniqueSet.contains(element) {
                uniqueSet.remove(element)
                repeatSet.insert(element)
            }
        }

        return uniqueSet.first!
    }
}

