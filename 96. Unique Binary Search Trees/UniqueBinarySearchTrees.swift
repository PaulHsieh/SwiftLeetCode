//
//  UniqueBinarySearchTrees.swift
//  UniqueBinarySearchTrees
//
//  Created by Paul Hsieh on 2020/12/12.
//


// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Unique Binary Search Trees.
// Memory Usage: 13.7 MB, less than 67.27% of Swift online submissions for Unique Binary Search Trees.

class Solution {
    var sameResult: [Int: Int] = [:]
    func numTrees(_ n: Int) -> Int {
        if n == 1 || n == 0 {
            return 1
        } else if n == 2 {
            return 2
        } else if let value = sameResult[n] {
            return value
        }

        var index = 0
        var result = 0
        while index < n {
            result += numTrees(index) * numTrees(n - index - 1)
            if sameResult[n-1] == nil {
                sameResult[n-1] = result
            }
            index += 1
        }
        return result
    }
}
