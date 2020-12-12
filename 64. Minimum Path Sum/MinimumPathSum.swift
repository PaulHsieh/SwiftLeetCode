//
//  MinimumPathSum.swift
//  MinimumPathSum
//
//  Created by Paul Hsieh on 2020/12/13.
//

/// Runtime: 56 ms, faster than 78.35% of Swift online submissions for Minimum Path Sum.
/// Memory Usage: 14.6 MB, less than 41.24% of Swift online submissions for Minimum Path Sum.

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let yLimit = grid.count - 1
        let xLimit = grid[0].count - 1
        var paths = grid

        for row in 0...yLimit {
            for col in 0...xLimit {
                var minValue = Int.max
                if row > 0 {
                    minValue = paths[row - 1][col]
                }
                if col > 0 {
                    minValue = min(minValue, paths[row][col - 1])
                }
                paths[row][col] += minValue == Int.max ? 0 : minValue
            }
        }

        return paths[yLimit][xLimit]
    }
}
