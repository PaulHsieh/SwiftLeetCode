//
//  ValidPalindromeII_CChar.swift
//  ValidPalindromeII_CChar
//
//  Created by Paul Hsieh on 2020/12/15.
//

/// Runtime: 72 ms, faster than 93.47% of Swift online submissions for Valid Palindrome II.
/// Memory Usage: 17.6 MB, less than 5.71% of Swift online submissions for Valid Palindrome II.

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
            var leftArray = charArray
            leftArray.remove(at: startIndex)
            var rightArray = charArray
            rightArray.remove(at: endIndex)
            return validate(leftArray, from: 0, to: leftArray.count - 2) || validate(rightArray, from: 0, to: rightArray.count - 2)
        }
    }
    
    func validate(_ s: [CChar], from: Int, to: Int) -> Bool {
        guard s.count > 2 else { return true }
        var startIndex = 0
        var endIndex = s.count - 2
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
