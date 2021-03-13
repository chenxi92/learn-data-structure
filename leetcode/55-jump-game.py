# coding: utf-8

# https://leetcode.com/problems/jump-game/

# Given an array of non-negative integers nums, you are initially
# positioned at the first index of the array.
# Each element in the array represents your maximum jump length at that
# position. Determine if you are able to reach the last index.


class Solution(object):
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        rightMost = 0
        i = 0
        while i < len(nums):
            if i <= rightMost:
                rightMost = max(rightMost, i + nums[i])
                if rightMost >= len(nums) - 1:
                    return True
            i += 1
        return False


nums = [3, 2, 1, 0, 4]
print Solution().canJump(nums)
print Solution().canJump1([0, 2, 3])
