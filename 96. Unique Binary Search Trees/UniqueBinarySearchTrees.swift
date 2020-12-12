//
//  UniqueBinarySearchTrees.swift
//  UniqueBinarySearchTrees
//
//  Created by Paul Hsieh on 2020/12/12.
//


/// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Unique Binary Search Trees.
/// Memory Usage: 13.7 MB, less than 67.27% of Swift online submissions for Unique Binary Search Trees.

/*
 Concept:
 Assume we have an given k = 5, now we can flat them as the following sequence:
 
 1 2 3 4 5
 
 Then we seperate them in to two sequence by index-left and index-right, for exmple index = 0, and now we can imagine the two sequence as the following:
 
 (null)  *1*  2 3 4 5
 
 Now we need to caculate the sum of lhs and rhs from index first to last, the possibilities of each side only depends on the number of the elements,
 no matter the values, the reason is this is an UBST, so any of continuous number sequence with same length give you the same amount of combination, that's the key point.
 For example, the combinations of [2, 3, 4] are absolutly equals to [100, 101, 102].
 
 So, let's start to caculate it!
 
 *** Just like the Fibonacci, we can set F(1) = 1, F(2) = 2 as known condition ***
 
 (null)      *1*     2 3 4 5   => F(null) * F(4)
   1         *2*     3 4 5     => F(1) * F(3)
   1 2       *3*     4 5       => F(2) * F(2)
   1 2 3     *4*     5         => F(3) * F(1)
   1 2 3 4   *5*   (null)      => F(4) * F(null)
 
 So the result is the sum of all the results above:
 
 F(null) * F(4) + F(1) * F(3) + F(2) * F(2) + F(3) * F(1) + F(4) * F(null)
 
 And we can reduce it to:
 2 * ( F(null)*F(4) + F(1)*F(3) + F(2)*F(2) + F(3)*F(1) + F(4)*F(null) )
 
 Then we can get the solution formula as below:

 F(0) = 1 (just for caculation, this condtion not exist actually)
 F(1) = 1
 F(2) = 2
 F(n) = Sum( F(k) * F(n - k - 1)) ) condition: n > 2, k in 0 ..< n
*/

class Solution {
    var sameResult: [Int: Int] = [:]
    func numTrees(_ n: Int) -> Int {
        if n == 1 || n == 0 {
            return 1
        } else if n == 2 {
            return 2
        } else if let value = sameResult[n] {
            return value
        }

        var index = 0
        var result = 0
        while index < n {
            result += numTrees(index) * numTrees(n - index - 1)
            if sameResult[n-1] == nil {
                sameResult[n-1] = result
            }
            index += 1
        }
        return result
    }
}
