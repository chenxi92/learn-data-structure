# coding: utf-8

# https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
# Given a sorted array nums, remove the duplicates in-place such that
# duplicates appeared at most twice and return the new length.
# Do not allocate extra space for another array; you must do this by
# modifying the input array in-place with O(1) extra memory.

# Constraints:
# 1 <= nums.length <= 3 * 104
# -104 <= nums[i] <= 104
# nums is sorted in ascending order.


class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        count = 1
        i = 1
        while i < len(nums):
            if nums[i] == nums[i - 1]:
                count += 1
                if count > 2:
                    nums.pop(i)
                    i -= 1
            else:
                count = 1
            i += 1
        return len(nums)

    def removeDuplicates1(self, nums):
        index = 1
        count = 1
        for i in range(1, len(nums)):
            if nums[i] == nums[i - 1]:
                count += 1
            else:
                count = 1
            if count <= 2:
                nums[index] = nums[i]
                index += 1
        return index


nums = [1, 1, 1, 2, 2, 3]
print Solution().removeDuplicates1(nums)
print nums
