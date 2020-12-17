//
//  AddTwoNumbers.swift
//  AddTwoNumbers
//
//  Created by Paul Hsieh on 2020/12/17.
//

/// Runtime: 40 ms, faster than 92.62% of Swift online submissions for Add Two Numbers.
/// Memory Usage: 13.7 MB, less than 82.85% of Swift online submissions for Add Two Numbers.

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else { return nil }

        var l1Walk: ListNode? = l1
        var l2Walk: ListNode? = l2
        var resultHead: ListNode? = nil
        var walk: ListNode? = nil
        var carry = 0
        while l1Walk != nil || l2Walk != nil {
            let v1 = l1Walk?.val ?? 0
            let v2 = l2Walk?.val ?? 0
            let tempSum = v1 + v2 + carry
            let (q, r): (Int, Int) = tempSum.quotientAndRemainder(dividingBy: 10)
            let newNode = ListNode(r)
            carry = q
            
            walk?.next = newNode
            walk = newNode
            if resultHead == nil {
                resultHead = walk
            }
            if l1Walk?.next == nil, l2Walk?.next == nil, carry > 0 {
                walk?.next = ListNode(carry)
                break
            }
            
            l1Walk = l1Walk?.next
            l2Walk = l2Walk?.next

        }

        return resultHead
    }
}

