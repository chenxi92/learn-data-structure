# coding: utf-8

# https://leetcode.com/problems/3sum-closest/

# Given an array nums of n integers and an integer target, find three
# integers in nums such that the sum is closest to target.
# Return the sum of the three integers.
# You may assume that each input would have exactly one solution.

# Constraints:
# 3 <= nums.length <= 10^3
# -10^3 <= nums[i] <= 10^3
# -10^4 <= target <= 10^4

class Solution(object):
    def threeSumClosest(self, nums, target):
        nums.sort()
        result = nums[0] + nums[1] + nums[len(nums) - 1]
        for i in range(len(nums) - 2):
            left = i + 1
            right = len(nums) - 1
            while left < right:
                sum = nums[i] + nums[left] + nums[right]
                if sum == target:
                    return target
                elif sum > target:
                    right -= 1
                else:
                    left += 1
                if abs(sum - target) < abs(target - result):
                    result = sum
        return result


print Solution().threeSumClosest([-1, 2, 1, -4], 3)
print Solution().threeSumClosest([0, 1, 2], 3)
