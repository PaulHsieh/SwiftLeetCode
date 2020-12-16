//
//  ReverseLinkedListII_Reverting_Optimized.swift
//  ReverseLinkedListII_Reverting_Optimized
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 4 ms, faster than 93.88% of Swift online submissions for Reverse Linked List II.
/// Memory Usage: 14.1 MB, less than 30.61% of Swift online submissions for Reverse Linked List II.

/*
 Concept:
 This solution refers to cl0ud_runner's answer on LeetCode discussion, and the link is:
 https://leetcode.com/problems/reverse-linked-list-ii/discuss/30693/Swift-solution
 
 The solution is to add a node and set its next pointer to the head node.
 Use a better way to do the revert and reduced all the logic to determine the actions after reverted.
 You can compared the solution to ReverseLinkedListII.swift in the same folder, but it seems reached O(n) time complexity for both.
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard n > 1 else { return head }
        let pointToHeadNode: ListNode = ListNode()
        var next: ListNode? = nil
        var pre: ListNode? = pointToHeadNode
        var walk: ListNode? = head
        var numOfNode = 1
        
        pointToHeadNode.next = head
        while walk != nil, numOfNode < m {
            pre = walk
            walk = walk?.next
            numOfNode += 1
        }
        
        next = walk?.next
        while numOfNode < n {
            walk?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
            next = walk?.next
            numOfNode += 1
        }
        
        return pointToHeadNode.next
    }
}
