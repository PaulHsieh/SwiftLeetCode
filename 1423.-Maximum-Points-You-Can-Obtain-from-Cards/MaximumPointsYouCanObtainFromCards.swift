//
//  MaximumPointsYouCanObtainFromCards.swift
//  MaximumPointsYouCanObtainFromCards
//
//  Created by Paul Hsieh on 2021/03/20.
//

/// Runtime: 480 ms, faster than 58.00% of Swift online submissions for Maximum Points You Can Obtain from Cards.
/// Memory Usage: 18.3 MB, less than 26.00% of Swift online submissions for Maximum Points You Can Obtain from Cards.

/// Concept: Sliding window
/// To sum the first k elements as the initail value, and masked last rest of the elements, then shift 1 of the mask  lower bound and upper bound,
/// then minus the lower bound current value and plus the upper bound + 1 to check is bigger than initial value, replace it if so or keep the value for next shifting.

class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        guard cardPoints.count != k else {
            return cardPoints.reduce(0, +)
        }

        var windowLowerBound = k
        var windowUpperBound = cardPoints.count - 1
        var maxValue = cardPoints[0...(k - 1)].reduce(0, +)
        var runValue = maxValue
        
        while windowLowerBound > 0 {
            windowLowerBound -= 1
            windowUpperBound -= 1
            runValue = runValue - cardPoints[windowLowerBound] + cardPoints[windowUpperBound + 1]
            if runValue > maxValue {
                maxValue = runValue
            }
        }
        return maxValue
    }
}
