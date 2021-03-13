# coding: utf-8

# https://leetcode.com/problems/jump-game-ii/

# Given an array of non-negative integers nums, you are initially
# positioned at the first index of the array. Each element in the array
# represents your maximum jump length at that position.
# Your goal is to reach the last index in the minimum number of jumps.
# You can assume that you can always reach the last index.

# Constraints:
# 1 <= nums.length <= 1000
# 0 <= nums[i] <= 105


class Solution(object):
    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        step = 0
        end = 0
        maxPosition = 0
        for i in range(len(nums) - 1):
            maxPosition = max(maxPosition, i + nums[i])
            if i == end:
                end = maxPosition
                step += 1
        return step


nums = [2, 3, 1, 1, 4]
print Solution().jump(nums)
