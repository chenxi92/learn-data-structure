# coding; utf-8

# https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

# There is an integer array nums sorted in non-decreasing order
# (not necessarily with distinct values). Before being passed to your
# function, nums is rotated at an unknown pivot index k (0 <= k < nums.length)
# such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1],
# nums[0], nums[1], ..., nums[k-1]] (0-indexed).
# For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and
# become [4,5,6,6,7,0,1,2,4,4].
# Given the array nums after the rotation and an integer target,
# return true if target is in nums, or false if it is not in nums.

# Constraints:
# 1 <= nums.length <= 5000
# -104 <= nums[i] <= 104
# nums is guaranteed to be rotated at some pivot.
# -104 <= target <= 104

# input: [4, 5, 6, 6, 7, 0, 1, 2, 4, 4]
# first sorted array: [4, 5, 6, 6, 7]
# second sorted array: [0, 1, 2, 4, 4]

class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: bool
        """
        if len(nums) == 0:
            return False
        start = 0
        end = len(nums) - 1
        while start <= end:
            mid = (end + start) / 2
            if nums[mid] == target:
                return True

            # if mid equal start, it may belong to both
            # first and second array
            if nums[start] == nums[mid]:
                start += 1
                continue
            pivotArray = (nums[start] <= nums[mid])
            targetArray = (nums[start] <= target)
            if pivotArray ^ targetArray:
                # mid and target in different sorted array
                if pivotArray:
                    # mid in the first sorted array
                    start = mid + 1
                else:
                    # target in the frist sorted array
                    end = mid - 1
            else:
                # mid and tartet in same sorted array
                if nums[mid] < target:
                    start = mid + 1
                else:
                    end = mid - 1

        return False


nums = [4, 5, 6, 6, 7, 0, 1, 2, 4, 4]
print Solution().search(nums, 8)
