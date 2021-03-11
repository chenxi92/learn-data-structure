# coding: utf-8

# https://leetcode.com/problems/next-permutation/

# Implement next permutation, which rearranges numbers into the
# lexicographically next greater permutation of numbers.
# If such an arrangement is not possible, it must rearrange it as
# the lowest possible order (i.e., sorted in ascending order).
# The replacement must be in place and use only constant extra memory.

# Constraints:
# 1 <= nums.length <= 100
# 0 <= nums[i] <= 100


class Solution(object):
    def nextPermutation(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead
        """
        i = len(nums) - 2
        while i >= 0 and nums[i + 1] <= nums[i]:
            i -= 1
        if i >= 0:
            j = len(nums) - 1
            while j >= 0 and nums[j] <= nums[i]:
                j -= 1
            nums[i], nums[j] = nums[j], nums[i]

        start = i + 1
        end = len(nums) - 1
        while start < end:
            nums[start], nums[end] = nums[end], nums[start]
            start += 1
            end -= 1
        return nums


nums = [1, 2, 3]
nums = [9, 5, 4, 3, 1]
nums = [1, 5, 8, 4, 7, 6, 5, 3, 1]
print nums
print Solution().nextPermutation(nums)
