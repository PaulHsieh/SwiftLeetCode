//
//  ValidPalindrome.swift
//  ValidPalindrome
//
//  Created by Paul Hsieh on 2020/12/14.
//

/// Runtime: 20 ms, faster than 71.66% of Swift online submissions for Valid Palindrome.
/// Memory Usage: 18 MB, less than 14.29% of Swift online submissions for Valid Palindrome.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let strArray = Array(s)
        var starIndex = 0
        var endIndex = s.count - 1
        var leftSubString = [Character]()
        var rightSubString = [Character]()
        while starIndex <= endIndex {
            let forwardChar = strArray[starIndex]
            if !forwardChar.isLetter, !forwardChar.isNumber {
                starIndex += 1
                continue
            }
            let backwardChar = strArray[endIndex]
            if !backwardChar.isLetter, !backwardChar.isNumber {
                endIndex -= 1
                continue
            }
            
            leftSubString.append(forwardChar)
            rightSubString.append(backwardChar)
            starIndex += 1
            endIndex -= 1
        }

        return String(leftSubString).lowercased() == String(rightSubString).lowercased()
    }
}
