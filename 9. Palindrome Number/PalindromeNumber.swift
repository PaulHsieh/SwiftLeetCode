//
//  PalindromeNumber.swift
//  PalindromeNumber
//
//  Created by Paul Hsieh on 2020/12/16.
//

/// Runtime: 44 ms, faster than 71.02% of Swift online submissions for Palindrome Number.
/// Memory Usage: 14 MB, less than 79.46% of Swift online submissions for Palindrome Number.

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let stringX = String(x)
        let reversedX = String(stringX.reversed())
        return  reversedX == stringX
    }
}
