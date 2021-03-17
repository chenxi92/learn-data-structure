# coding: utf-8

# https://leetcode.com/problems/sort-colors/
# Given an array nums with n objects colored red, white, or blue, sort them
# in-place so that objects of the same color are adjacent, with the colors in
# the order red, white, and blue. We will use the integers 0, 1, and 2 to
# represent the color red, white, and blue, respectively.

# Constraints:
# n == nums.length
# 1 <= n <= 300
# nums[i] is 0, 1, or 2.


class Solution(object):
    def sortColors(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        ptr = 0
        for i in range(len(nums)):
            if nums[i] == 0:
                nums[ptr], nums[i] = nums[i], nums[ptr]
                ptr += 1
        for i in range(ptr, len(nums)):
            if nums[i] == 1:
                nums[ptr], nums[i] = nums[i], nums[ptr]
                ptr += 1

    def sortColors1(self, nums):
        p0 = 0
        p1 = 0
        for i in range(len(nums)):
            if nums[i] == 0:
                nums[i], nums[p0] = nums[p0], nums[i]
                if p0 < p1:
                    nums[i], nums[p1] = nums[p1], nums[i]
                p0 += 1
                p1 += 1
            elif nums[i] == 1:
                nums[i], nums[p1] = nums[p1], nums[i]
                p1 += 1


nums = [2, 0, 2, 1, 1, 0]
print nums
print "--- after sort ---"
Solution().sortColors1(nums)
print nums
