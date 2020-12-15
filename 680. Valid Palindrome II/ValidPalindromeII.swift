//
//  ValidPalindromeII.swift
//  ValidPalindromeII
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 84 ms, faster than 86.12% of Swift online submissions for Valid Palindrome II.
/// Memory Usage: 17.6 MB, less than 5.71% of Swift online submissions for Valid Palindrome II.

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var charArray = s.cString(using: .utf8)!
        return validate(&charArray, from: 0, to: charArray.count - 2)
    }
    
    func validate(_ s: inout [CChar], from: Int, to: Int) -> Bool {
        guard from < to else { return false }
        var startIndex = from
        var endIndex = to
        while startIndex < endIndex {
            if s[startIndex] == s[endIndex] {
                startIndex += 1
                endIndex -= 1
            } else {
                var newStringRemovedLeft = Array(s)
                newStringRemovedLeft.remove(at: startIndex)
                var newStringRemovedRight = Array(s)
                newStringRemovedRight.remove(at: endIndex)
                var isPalindrome = true
                startIndex = 0
                endIndex = newStringRemovedLeft.count - 2
                inner: while startIndex < endIndex, newStringRemovedLeft.count > 1 {
                    if newStringRemovedLeft[startIndex] != newStringRemovedLeft[endIndex] {
                        isPalindrome = false
                        break inner
                    } else {
                        startIndex += 1
                        endIndex -= 1
                    }
                }
                
                if isPalindrome == true {
                    return true
                }
                
                isPalindrome = true
                startIndex = 0
                endIndex = newStringRemovedRight.count - 2
                inner: while startIndex < endIndex, newStringRemovedRight.count > 1 {
                    if newStringRemovedRight[startIndex] != newStringRemovedRight[endIndex] {
                        isPalindrome = false
                        break inner
                    } else {
                        startIndex += 1
                        endIndex -= 1
                    }
                }
                return isPalindrome
            }
        }

        return true
    }
}
