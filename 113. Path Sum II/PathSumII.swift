//
//  PathSumII.swift
//  PathSumII
//
//  Created by Paul Hsieh on 2020/12/10.
//


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var pathArray = [Int]()
        dfs(root: root, sum: sum, dfsSum: 0, pathArray: &pathArray, dfsArray: &result)
        return result
    }
    
    func dfs(root: TreeNode, sum: Int, dfsSum: Int, pathArray: inout [Int], dfsArray: inout [[Int]]){
        let currentSum = dfsSum + root.val
        if root.left == nil, root.right == nil, sum == currentSum {
            var result = pathArray
            result.append(root.val)
            dfsArray.append(result)
            return
        }
        
        pathArray.append(root.val)
        if let left = root.left {
            dfs(root: left, sum: sum, dfsSum: currentSum, pathArray: &pathArray, dfsArray: &dfsArray)
        }
        if let right = root.right {
            dfs(root: right, sum: sum, dfsSum: currentSum, pathArray: &pathArray, dfsArray: &dfsArray)
        }
        pathArray.removeLast()
        
        return
    }
}
