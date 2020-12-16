//
//  ReverseLinkedListII.swift
//  ReverseLinkedListII
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 4 ms, faster than 93.88% of Swift online submissions for Reverse Linked List II.
/// Memory Usage: 13.7 MB, less than 89.80% of Swift online submissions for Reverse Linked List II.

/*
 Concept:
 ** Keypoint is to find the node X just before the node m, and then revert from number m node A to nember m+n node B and then find the head of the rest of nodes Y. **
 By following the idea above, the actions are as below:
 1. Find X
 2. Revert from A to B
 3. X.next = B
 4. A.next = Y
 
 But we have some tricky cases should be considered before we start:
 What if there are only one node and m = 1, n = 1?
    => Simply return head (nothing changed)
 
 What if A = 1 and B absolutly equals to the input nodes?
 ex: A -> .... -> B
    => It means head had been changed to B, so should return B for this case
 
 What if A = 1 and B is not the last node?
 ex: A -> ... -> B -> ... -> C
    => The head been changed to B, and A should link its next to C then return B
 
 What if A != 1 and B is the last node?
 ex: F -> ... -> A -> ... -> B
    => The head not changed, but A should link its next to nil, and the original node before B, for example K, should link its next to B, then return F
 
 So the whole conecpt will be reduce into the following conditions:
 1. If n < 2, return head
 2. Find X
 3. Revert from A to B
 4. If m > 1 => X.next = B
 5. If B is not the last one => A.next = Y
 6. Return m > 1 ? head : B
 
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
        var endNodeBeforeM: ListNode? = nil
        var revertEnd: ListNode? = nil
        
        var next: ListNode? = nil
        var pre: ListNode? = nil
        var walk: ListNode? = head

        var numOfNode = 1
        
        while walk != nil, numOfNode < m {
            endNodeBeforeM = walk
            walk = walk?.next
            numOfNode += 1
        }
        
        revertEnd = walk
        while walk != nil, numOfNode <= n {
            next = walk?.next
            walk?.next = pre
            pre = walk
            walk = next
            numOfNode += 1
        }
        

        if m > 1 {
            endNodeBeforeM?.next = pre
        }
        if walk != nil {
            revertEnd?.next = walk
        }
        
        return m > 1 ? head : pre
    }
}
