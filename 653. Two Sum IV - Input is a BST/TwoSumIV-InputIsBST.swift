//
//  TwoSumIV-InputIsBST.swift
//  TwoSumIV-InputIsBST
//
//  Created by Paul Hsieh on 2020/12/11.
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
    var nodeSet: Set<Int> = Set()
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        if nodeSet.contains( k - root.val) {
            return true
        } else {
            nodeSet.insert(root.val)
        }
        
        return findTarget(root.left, k) || findTarget(root.right, k)
    }
}
