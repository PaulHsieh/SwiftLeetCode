//
//  BinarySearchTreeToGreaterSumTree.swift
//  BinarySearchTreeToGreaterSumTree
//
//  Created by Paul Hsieh on 2020/12/17.
//

/// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Binary Search Tree to Greater Sum Tree.
/// Memory Usage: 13.9 MB, less than 66.67% of Swift online submissions for Binary Search Tree to Greater Sum Tree.

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        _ = sumTree(root: root, preSum: 0)
        return root
    }
    
    func sumTree(root: TreeNode, preSum: Int) -> Int {
        var sub = preSum
        if let right = root.right {
           sub = sumTree(root: right, preSum: preSum)
        }
        
        root.val += sub
        sub = root.val
        if let left = root.left {
            sub = sumTree(root: left, preSum: sub)
        }
        
        return sub
    }
}
