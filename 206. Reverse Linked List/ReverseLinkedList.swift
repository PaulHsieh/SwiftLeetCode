//
//  ReverseLinkedList.swift
//  ReverseLinkedList
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 12 ms, faster than 92.45% of Swift online submissions for Reverse Linked List.
/// Memory Usage: 15 MB, less than 45.75% of Swift online submissions for Reverse Linked List.

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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var pre: ListNode? = nil
        var walk: ListNode? = head
        var next: ListNode? = nil
        while walk != nil {
            next = walk?.next
            walk?.next = pre
            pre = walk
            walk = next
        }
        
        return pre
    }
}
