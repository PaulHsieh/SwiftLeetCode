//
//  NumberOfSegmentsInAString_Logic_Only.swift
//  NumberOfSegmentsInAString_Logic_Only
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Number of Segments in a String.
/// Memory Usage: 14.3 MB, less than 57.14% of Swift online submissions for Number of Segments in a String.

class Solution {
    func countSegments(_ s: String) -> Int {
        var previousCharacter: Character!
        var count = 0
        for c in s {
            if c == " ", let pre = previousCharacter, pre != " " {
                count += 1
            }
            previousCharacter = c
        }
        
        return (previousCharacter == " " || previousCharacter == nil) ? count : count + 1
    }
}
