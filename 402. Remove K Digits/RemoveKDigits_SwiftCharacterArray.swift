//
//  RemoveKDigits_SwiftCharacterArray.swift
//  RemoveKDigits_SwiftCharacterArray
//
//  Created by Paul Hsieh on 2020/12/10.
//


class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k > num.count || num.count == 0 { return "0"}
        var count = 0
        var charArray = Array(num)
        var index = 0

        while index < charArray.count, count < k {
            if index > 0, charArray[index] < charArray[index - 1] {
                charArray.remove(at: index - 1)
                count += 1
                index -= 1
                continue
            }

            index += 1
        }

        while count < k {
            charArray.removeLast()
            count += 1
        }

        while charArray.first == Character("0") {
            charArray.removeFirst()
        }

        return charArray.isEmpty ? "0" : String(charArray)
    }
}
