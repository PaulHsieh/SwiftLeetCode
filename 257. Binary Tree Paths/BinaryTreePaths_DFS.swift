//
//  BinaryTreePaths.swift
//  BinaryTreePaths_DFS
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var result = [String]()
        dfs(root: root, dfsString: "", dfsArray: &result)
        return result
    }
    
    func dfs(root: TreeNode, dfsString: String, dfsArray: inout [String]) {
        let currentDfsString = dfsString == "" ? "\(root.val)" : dfsString + "->\(root.val)"
        if root.left == nil, root.right == nil {
            dfsArray.append(currentDfsString)
            return
        }
        if let left = root.left {
            dfs(root: left, dfsString: currentDfsString, dfsArray: &dfsArray)
        }
        if let right = root.right {
            dfs(root: right, dfsString: currentDfsString, dfsArray: &dfsArray)
        }
        
        return
    }
}
