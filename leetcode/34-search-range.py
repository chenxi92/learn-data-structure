# coding: utf-8

# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
# Given an array of integers nums sorted in ascending order, find the starting
# and ending position of a given target value.
# If target is not found in the array, return [-1, -1].
# Follow up: Could you write an algorithm with O(log n) runtime complexity?

# Constraints:
# 0 <= nums.length <= 105
# -109 <= nums[i] <= 109
# nums is a non-decreasing array.
# -109 <= target <= 109


class Solution(object):
    def searchRange(self, nums, target):
        result = [-1, -1]
        for (i, v) in enumerate(nums):
            if v == target:
                result[0] = i
                break
        if result[0] == -1:
            return result
        j = len(nums) - 1
        while j >= 0:
            if nums[j] == target:
                result[1] = j
                break
            j -= 1
        return result

    def extreme_insertion_index(self, nums, target, left):
        lo = 0
        hi = len(nums)
        while lo < hi:
            mid = (lo + hi) / 2
            if nums[mid] > target or (left and target == nums[mid]):
                hi = mid
            else:
                lo = mid + 1
        return lo

    def searchRange1(self, nums, target):
        leftIdx = self.extreme_insertion_index(nums, target, True)
        if leftIdx == len(nums) or nums[leftIdx] != target:
            return [-1, -1]
        return [leftIdx, self.extreme_insertion_index(nums, target, False) - 1]


print Solution().searchRange([5, 7, 7, 8, 8, 10], 8)
print Solution().searchRange1([5, 7, 7, 8, 8, 10], 8)

