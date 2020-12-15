//
//  ValidPalindromeII_CChar.swift
//  ValidPalindromeII_CChar
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 132 ms, faster than 82.04% of Swift online submissions for Valid Palindrome II.
/// Memory Usage: 14.6 MB, less than 80.00% of Swift online submissions for Valid Palindrome II.

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var startIndex = s.startIndex
        var endIndex = s.index(before: s.endIndex)
        while startIndex < endIndex {
            if s[startIndex] == s[endIndex] {
                startIndex = s.index(after: startIndex)
                endIndex = s.index(before: endIndex)
            } else {
                return validate(s, from: s.index(after: startIndex), to: endIndex) || validate(s, from: startIndex, to: s.index(before: endIndex))
            }
        }
        
        return true
    }
    
    func validate(_ s: String, from: String.Index, to: String.Index) -> Bool {
        guard s.count > 2 else { return true }
        var startIndex = from
        var endIndex = to
        while startIndex < to {
            if s[startIndex] != s[endIndex] {
                return false
            } else {
                startIndex = s.index(after: startIndex)
                endIndex = s.index(before: endIndex)
            }
        }
        
        return true
    }
}
