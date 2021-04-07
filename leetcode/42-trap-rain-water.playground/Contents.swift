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
    
    func trap1(_ height: [Int]) -> Int {
        if height.count < 2 {
            return 0
        }
        var leftMax = Array(repeating: 0, count: height.count)
        leftMax[0] = height[0]
        for i in 1..<height.count {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        var rightMax = Array(repeating: 0, count: height.count)
        rightMax[height.count - 1] = height[height.count - 1]
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            rightMax[i] = max(height[i], rightMax[i + 1])
        }
        var ans = 0
        for i in 1..<height.count - 1 {
            ans += min(leftMax[i], rightMax[i]) - height[i]
        }
        return ans
    }
}

let height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
print(Solution().trap(height))
print(Solution().trap1(height))
