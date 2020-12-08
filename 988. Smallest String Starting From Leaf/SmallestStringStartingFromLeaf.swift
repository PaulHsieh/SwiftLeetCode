//
//  SmallestStringStartingFromLeaf.swift
//  LeetCodePractice
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
    let dic: [Int: String] = [0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f", 6:"g", 7:"h", 8:"i"
                                  , 9:"j", 10:"k", 11:"l", 12:"m", 13:"n", 14:"o", 15:"p", 16:"q", 17:"r"
                                  , 18:"s", 19:"t", 20:"u", 21:"v", 22:"w", 23:"x", 24:"y", 25:"z"]
    
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        return dfs(root, dfsString: "")
        
    }
    
    func dfs(_ root: TreeNode, dfsString: String) -> String {
        if root.left == nil, root.right == nil {
            return dic[root.val]! + dfsString
        }
        var leftVal: String = ""
        var rightVal: String = ""
        
        if let left = root.left {
            leftVal += dfs(left, dfsString: dic[root.val]! + dfsString)
        }
        if let right = root.right {
            rightVal += dfs(right, dfsString: dic[root.val]! + dfsString)
        }

        if leftVal.isEmpty || rightVal.isEmpty {
            return leftVal.isEmpty ? rightVal : leftVal
        }
        if leftVal < rightVal {
            return leftVal
        } else {
            return rightVal
        }
        
    }
}
