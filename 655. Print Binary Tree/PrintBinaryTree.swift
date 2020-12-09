//
//  PrintBinaryTree.swift
//  PrintBinaryTree
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
    var heighestLevel = 0
    var resultArray = [[String]]()
    var numOfColumn = 0
    func printTree(_ root: TreeNode?) -> [[String]] {
        guard let root = root else { return [[]] }
        findLargestNode(root: root, level: 1)
        createResultArray()
        findCenterPosition(root: root, level: 1, start: 0, end: numOfColumn)
        return resultArray
    }

    func findLargestNode(root: TreeNode, level: Int) {
        if root.left == nil, root.right == nil {
                heighestLevel = max(level, heighestLevel)
        }
        if let right = root.right {
            findLargestNode(root: right, level: level + 1)
        }
        if let left = root.left {
            findLargestNode(root: left, level: level + 1)
        }
    }

    func createResultArray() {
        numOfColumn = 1 << heighestLevel - 1

        resultArray = Array(repeating: Array(repeating: "", count: Int(numOfColumn)), count: heighestLevel)
    }

    func findCenterPosition(root: TreeNode, level: Int, start: Int, end: Int) {
        let center = (start + end) / 2
        resultArray[level - 1][center] = "\(root.val)"

        if let left = root.left {
            findCenterPosition(root: left, level: level + 1, start: start, end: center)
        }
        if let right = root.right {
            findCenterPosition(root: right, level: level + 1, start: center + 1, end: end)
        }
    }
}
