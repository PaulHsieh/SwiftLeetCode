//
//  BinaryTreePaths.swift
//  BinaryTreePaths
//
//  Created by Paul Hsieh on 2020/12/9.
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
        if root.left == nil, root.right == nil {
            return ["\(root.val)"]
        }
        var pathArray = [String]()
        
        if let left = root.left {
            pathArray.append(contentsOf: binaryTreePaths(left))
        }
        if let right = root.right {
            pathArray.append(contentsOf: binaryTreePaths(right))
        }
        
        return pathArray.map { val in
            return "\(root.val)->\(val)"
        }
    }
}
