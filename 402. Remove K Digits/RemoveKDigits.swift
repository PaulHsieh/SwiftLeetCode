//
//  RemoveKDigits.swift
//  RemoveKDigits
//
//  Created by Paul Hsieh on 2020/12/10.
//


class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var count = 0
        var result: [CChar] = "".cString(using: .utf8)!
        if num.count == k {
            return "0"
        }

        for (index, v) in num.utf8CString[0..<num.utf8CString.count - 1].enumerated() {
            if result.count == 1 {
                result.insert(v, at: result.count - 1)
            } else {
                result.insert(v, at: result.count - 1)
                if result[result.count - 2] < result[result.count - 3] {
                    result.remove(at: result.count - 3)
                    count += 1
                }
            }

            if result.first == "0".utf8CString.first {
                result.removeFirst()
            }


            while (result.count >= 3 && result[result.count - 2] < result[result.count - 3] && count < k) {
                result.remove(at: result.count - 3)
                count += 1
            }

            if count >= k {
                if index < num.utf8CString.count - 1 {
                    result.insert(contentsOf: num.utf8CString[index+1..<num.utf8CString.count - 1], at: result.count - 1)
                }

                if let s = String(cString: result, encoding: .utf8) {
                    if s == "" {
                        return "0"
                    } else {
                        return s
                    }
                } else {
                    return "0"
                }
            }
        }

        while count < k {
            result.remove(at: result.count - (result.count >= 3 ? 2 : 1))
            count += 1
            if result.first == "0".utf8CString.first {
                result.removeFirst()
            }
        }

        if let s = String(cString: result, encoding: .utf8) {
            if s == "" {
                return "0"
            } else {
                return s
            }
        } else {
            return "0"
        }
    }
}
