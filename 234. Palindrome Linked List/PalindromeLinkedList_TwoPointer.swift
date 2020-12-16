//
//  PalindromeLinkedList.swift
//  PalindromeLinkedList
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 96 ms, faster than 62.43% of Swift online submissions for Palindrome Linked List.
/// Memory Usage: 19.3 MB, less than 49.74% of Swift online submissions for Palindrome Linked List.
/// 
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head, head.next != nil else { return true }
        var reversHead: ListNode? = head
        var walk: ListNode? = head
        
        // find center node
        while walk?.next != nil {
            walk = walk?.next?.next
            reversHead = reversHead?.next
        }
        
        
        // reverse
        var pre: ListNode? = nil
        while reversHead != nil {
            let next = reversHead?.next
            reversHead?.next = pre
            pre = reversHead
            reversHead = next
        }
        reversHead = pre
        
        walk = head
        // if it has odd nodes, then reverseHead will be nil first
        // if it has even nodes, then both will be nil at same time
        while walk != nil, reversHead != nil {
            if walk?.val != reversHead?.val {
                return false
            }
            walk = walk?.next
            reversHead = reversHead?.next
        }
        
        return true
    }
}
