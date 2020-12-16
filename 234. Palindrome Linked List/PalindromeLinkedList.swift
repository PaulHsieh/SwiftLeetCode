//
//  PalindromeLinkedList.swift
//  PalindromeLinkedList
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 92 ms, faster than 80.95% of Swift online submissions for Palindrome Linked List.
/// Memory Usage: 22.6 MB, less than 29.63% of Swift online submissions for Palindrome Linked List.

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
        guard let head = head else { return true }
        var walk = head
        var result = [Int]()
        result.append(walk.val)
        while walk.next != nil {
            walk = walk.next!
            result.append(walk.val)
        }
        
        return result == result.reversed()
    }
}
