//
//  PathSumIII.swift
//  PathSumIII
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
        dfs(root: root, sum: sum, dfsSums: [Int](), resultCount: &resultCount)
        return resultCount
    }
    
    func dfs(root: TreeNode, sum: Int, dfsSums: [Int], resultCount: inout Int) {
        if root.val == sum {
            resultCount += 1
        }
        if root.left == nil, root.right == nil {
            _ = dfsSums.map { value in
                let r = value + root.val
                if r == sum {
                    resultCount += 1
                }
            }
            return
        }
        
        var currentDfsSums: [Int] = []
        if dfsSums.count == 0 {
            currentDfsSums.append(root.val)
        } else {
            currentDfsSums = dfsSums.map { value in
                let r = value + root.val
                if r == sum {
                    resultCount += 1
                }
                return value + root.val
            }
            currentDfsSums.append(root.val)
        }

        
        if let left = root.left {
            dfs(root: left, sum: sum, dfsSums: currentDfsSums, resultCount: &resultCount)
        }
        if let right = root.right {
            dfs(root: right, sum: sum, dfsSums: currentDfsSums, resultCount: &resultCount)
        }
    }
}
