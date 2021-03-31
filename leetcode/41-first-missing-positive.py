# coding: utf-8

# https://leetcode.com/problems/first-missing-positive/
# Given an unsorted integer array nums,
# find the smallest missing positive integer.

# Constraints:
# 0 <= nums.length <= 300
# -231 <= nums[i] <= 231 - 1


class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        n = len(nums)
        # round 1: mark negative num
        for i in range(n):
            if nums[i] <= 0:
                nums[i] = n + 1
        # print "1", nums
        # round 2: mark num belong [1, n]
        for i in range(n):
            num = abs(nums[i])
            if num <= n:
                nums[num - 1] = -abs(nums[num - 1])

        # print "2", nums
        for i in range(n):
            if nums[i] > 0:
                return i + 1
        return n + 1


nums = [3, 4, -1, 1]
# nums = [1]
print nums
print Solution().firstMissingPositive(nums)
