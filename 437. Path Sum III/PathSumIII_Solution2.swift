//
//  PathSumIII_Solution2.swift
//  PathSumIII_Solution2
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var resultCount: Int = 0
        var pathArray: [Int] = []
        dfs(root: root, sum: sum, pathArray: &pathArray, resultCount: &resultCount)
        return resultCount
    }
    
    func dfs(root: TreeNode, sum: Int, pathArray: inout [Int], resultCount: inout Int) {
        if root.val == sum {
            resultCount += 1
        }
        
        
        var tempSum = 0
        for value in pathArray {
            tempSum += value
            if tempSum + root.val == sum {
                resultCount += 1
            }
        }
        pathArray.insert(root.val, at: 0)
        
        if root.left == nil, root.right == nil {
            pathArray.remove(at: 0)
            return
        }
        
        if let left = root.left {
            dfs(root: left, sum: sum, pathArray: &pathArray, resultCount: &resultCount)
        }
        if let right = root.right {
            dfs(root: right, sum: sum, pathArray: &pathArray, resultCount: &resultCount)
        }
        pathArray.remove(at: 0)
        return
    }
}
