//
//  ValidPalindrome_Array.swift
//  ValidPalindrome_Array
//
//  Created by Paul Hsieh on 2020/12/14.
//

/// Runtime: 12 ms, faster than 98.39% of Swift online submissions for Valid Palindrome.
/// Memory Usage: 16 MB, less than 83.18% of Swift online submissions for Valid Palindrome.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let strArray = Array(s.lowercased())
        var starIndex = 0
        var endIndex = s.count - 1
        while starIndex < endIndex {
            while starIndex < endIndex, !strArray[starIndex].isLetter, !strArray[starIndex].isNumber {
                starIndex += 1
            }
            
            while endIndex > starIndex, !strArray[endIndex].isLetter, !strArray[endIndex].isNumber {
                endIndex -= 1
            }
            
            guard strArray[starIndex] == strArray[endIndex] else {
                return false
            }
            starIndex += 1
            endIndex -= 1
        }

        return true
    }
}
