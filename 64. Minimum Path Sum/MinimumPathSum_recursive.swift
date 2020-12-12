//
//  MinimumPathSum_recursive.swift
//  MinimumPathSum_recursive
//
//  Created by Paul Hsieh on 2020/12/13.
//

/// This solution can not pass the verification on LeetCode due to "Time Limit Exceeded", but checked the result is correct

class Solution {
    var shortestPath = Int.max
    var xLimit = 0
    var yLimit = 0
    func minPathSum(_ grid: [[Int]]) -> Int {
        xLimit = grid[0].count - 1
        yLimit = grid.count - 1
        var memo = grid
        findPath(x: 0, y: 0, current: 0, paths: &memo)
        return shortestPath
    }
    
    func findPath(x: Int, y: Int, current: Int, paths: inout [[Int]]) {
        if x + 1 <= xLimit {
            findPath(x: x + 1, y: y, current: current + paths[y][x], paths: &paths)
        }
        if y + 1 <= yLimit {
            findPath(x: x, y: y + 1, current: current + paths[y][x], paths: &paths)
        }
        
        if xLimit == x, yLimit == y {
            shortestPath = min(shortestPath, current + paths[y][x])
        }
    }
}
