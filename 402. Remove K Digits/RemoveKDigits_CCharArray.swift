//
//  RemoveKDigits_CCharArray.swift
//  RemoveKDigits_CCharArray
//
//  Created by Paul Hsieh on 2020/12/10.
//

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k > num.count || num.count == 0 { return "0"}
        var charArray: [CChar] = num.cString(using: .utf8)!
        var count = 0
        var index = 0
        
        while index < charArray.count - 1, count < k {
            if index > 0, charArray[index] < charArray[index - 1] {
                charArray.remove(at: index - 1)
                count += 1
                index -= 1
                continue
            }
            
            index += 1
        }
        
        while count < k {
            charArray.remove(at: charArray.count - 2)
            count += 1
        }
        
        let zeroCChar = "0".utf8CString.first
        while charArray.first == zeroCChar {
            charArray.removeFirst()
        }
        
        return charArray.count > 1 ? String(cString: charArray) : "0"
    }
}
