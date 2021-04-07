import UIKit

/**
 # https://leetcode.com/problems/trapping-rain-water/
 # Given n non-negative integers representing an elevation map where the width
 # of each bar is 1, compute how much water it can trap after raining.


 # Constraints:

 # n == height.length
 # 0 <= n <= 3 * 104
 # 0 <= height[i] <= 105
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        var ans: Int = 0
        for i in 0..<height.count {
            var leftMax = 0
            for l in 0...i {
                leftMax = max(leftMax, height[l])
            }
            var rightMax = 0
            for r in i..<height.count {
                rightMax = max(rightMax, height[r])
            }
            ans += min(leftMax, rightMax) - height[i]
        }
        return ans
    }
}

let height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
print(Solution().trap(height))
