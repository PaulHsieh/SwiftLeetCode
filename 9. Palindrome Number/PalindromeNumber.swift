//
//  PalindromeNumber.swift
//  PalindromeNumber
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 48 ms, faster than 59.50% of Swift online submissions for Palindrome Number.
/// Memory Usage: 14.3 MB, less than 31.86% of Swift online submissions for Palindrome Number.

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let reversed = String("\(x)".reversed())
        if let reversedInt = Int(reversed), reversedInt - x == 0 {
            return true
        } else {
            return false
        }
    }
}
