# coding: utf-8

# https://leetcode.com/problems/remove-duplicates-from-sorted-array/
# Given a sorted array nums, remove the duplicates in-place such that each element
# appears only once and returns the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array
# in-place with O(1) extra memory.

# Constraints:
# 0 <= nums.length <= 3 * 104
# -104 <= nums[i] <= 104
# nums is sorted in ascending order.


class Solution(object):
    def removeDuplicates(self, nums):
        if len(nums) < 1:
            return 0
        i = 0
        for j in range(1, len(nums)):
            if nums[i] != nums[j]:
                i += 1
                nums[i] = nums[j]
        return i + 1


print Solution().removeDuplicates([1, 1, 2])
