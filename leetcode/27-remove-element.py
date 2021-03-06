# coding: utf-8

# https://leetcode.com/problems/remove-element/

# Given an array nums and a value val,
# remove all instances of that value in-place and return the new length.

# Constraints:
# 0 <= nums.length <= 100
# 0 <= nums[i] <= 50
# 0 <= val <= 100


class Solution(object):
    def removeElement(self, nums, val):
        if len(nums) == 0:
            return 0
        i = 0
        j = 0
        n = len(nums) - 1
        while j <= len(nums) - 1 - i:
            if nums[j] == val and n - i >= j:
                nums[j], nums[n - i] = nums[n - i], nums[j]
                i += 1
                continue
            j += 1
        return n - i + 1

    def removeElement1(self, nums, val):
        i = 0
        n = len(nums)
        while i < n:
            if nums[i] == val:
                nums[i] = nums[n - 1]
                n -= 1
            else:
                i += 1
        return n

    def removeElement2(self, nums, val):
        i = 0
        j = 0
        while j < len(nums):
            if nums[j] != val:
                nums[i] = nums[j]
                i += 1
            j += 1
        return i


nums1 = [3, 2, 2, 2]
print nums1
length1 = Solution().removeElement2(nums1, 3)
print length1
# print nums1

nums = [0, 1, 2, 2, 3, 0, 4, 2, 2]
print nums
length = Solution().removeElement2(nums, 2)
print length
print nums
# for i in range(length):
#     print nums[i]
