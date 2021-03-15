# coding: utf-8

# https://leetcode.com/problems/maximum-subarray/

# Given an integer array nums, find the contiguous subarray (containing
# at least one number) which has the largest sum and return its sum.

# Constraints:
# 1 <= nums.length <= 3 * 104
# -105 <= nums[i] <= 105


class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        ans = nums[0]
        sum = 0
        for num in nums:
            if sum > 0:
                sum += num
            else:
                # discard the previous subarray
                sum = num
            ans = max(ans, sum)
        return ans


nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print Solution().maxSubArray(nums)
