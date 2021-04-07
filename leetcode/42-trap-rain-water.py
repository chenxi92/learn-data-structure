# coding: utf-8

# https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map where the width
# of each bar is 1, compute how much water it can trap after raining.


# Constraints:

# n == height.length
# 0 <= n <= 3 * 104
# 0 <= height[i] <= 105

class Solution(object):
    def trap(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        ans = 0
        for i in range(len(height)):
            leftMax = 0
            for l in range(0, i + 1):
                leftMax = max(leftMax, height[l])
            rightMax = 0
            for r in range(i, len(height)):
                rightMax = max(rightMax, height[r])
            ans += (min(leftMax, rightMax) - height[i])
        return ans


height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
# height = [4, 2, 0, 3, 2, 5]
print Solution().trap(height)
