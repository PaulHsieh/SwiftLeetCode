//
//  ValidPalindromeII_CChar.swift
//  ValidPalindromeII_CChar
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 68 ms, faster than 94.69% of Swift online submissions for Valid Palindrome II.
/// Memory Usage: 16.9 MB, less than 6.53% of Swift online submissions for Valid Palindrome II.

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let charArray = s.cString(using: .utf8)!
        var startIndex = 0
        var endIndex = charArray.count - 2
        while startIndex < endIndex, charArray[startIndex] == charArray[endIndex] {
            startIndex += 1
            endIndex -= 1
        }
        
        // crossed
        if startIndex >= endIndex {
            return true
        } else {
            return validate(charArray, from: startIndex + 1, to: endIndex) || validate(charArray, from: startIndex, to: endIndex - 1)
        }
    }
    
    func validate(_ s: [CChar], from: Int, to: Int) -> Bool {
        guard s.count > 2 else { return true }
        var startIndex = from
        var endIndex = to
        while startIndex < to {
            if s[startIndex] != s[endIndex] {
                return false
            } else {
                startIndex += 1
                endIndex -= 1
            }
        }
        
        return true
    }
}
