//
//  PalindromeNumber_Int.swift
//  PalindromeNumber_Int
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 32 ms, faster than 96.74% of Swift online submissions for Palindrome Number.
/// Memory Usage: 14.1 MB, less than 63.72% of Swift online submissions for Palindrome Number.

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var run = x
        var result = 0
        while run > 0 {
            result = (result * 10) + (run % 10)
            run /= 10
        }
        
        return (result == x)
    }
}
