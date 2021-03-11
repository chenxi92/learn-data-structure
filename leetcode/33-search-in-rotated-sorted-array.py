# coding: utf-8

# https://leetcode.com/problems/search-in-rotated-sorted-array/

# There is an integer array nums sorted in ascending order (with distinct
# values). Prior to being passed to your function, nums is rotated at an
# unknown pivot index k (0 <= k < nums.length) such that the resulting array
# is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]
# (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3
# and become [4,5,6,7,0,1,2].

# Given the array nums after the rotation and an integer target,
# return the index of target if it is in nums, or -1 if it is not in nums.

# Constraints:
# 1 <= nums.length <= 5000
# -104 <= nums[i] <= 104
# All values of nums are unique.
# nums is guaranteed to be rotated at some pivot.
# -104 <= target <= 104


class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        low = 0
        high = len(nums)
        while low < high:
            mid = (low + high) / 2
            # target and mid are on the samce side according to pivot
            if (nums[mid] < nums[0]) == (target < nums[0]):
                if nums[mid] < target:
                    low = mid + 1
                elif nums[mid] > target:
                    high = mid
                else:
                    return mid
            # target on the right side
            elif target < nums[0]:
                low = mid + 1
            # target on the left side
            else:
                high = mid
        return - 1


nums = [4, 5, 6, 7, 0, 1, 2]
nums = [5, 1, 3]
print Solution().search(nums, 5)
