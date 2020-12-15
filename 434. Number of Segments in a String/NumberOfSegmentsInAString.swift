//
//  NumberOfSegmentsInAString.swift
//  NumberOfSegmentsInAString
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Number of Segments in a String.
/// Memory Usage: 14.1 MB, less than 85.71% of Swift online submissions for Number of Segments in a String.

class Solution {
    func countSegments(_ s: String) -> Int {
        return s.split(separator: " ").count
    }
}
