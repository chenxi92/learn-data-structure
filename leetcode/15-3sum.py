# coding: utf-8

# https://leetcode.com/problems/3sum/

# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? 
# Find all unique triplets in the array which gives the sum of zero.
# Notice that the solution set must not contain duplicate triplets.

# Constraints:
# 0 <= nums.length <= 3000
# -105 <= nums[i] <= 105

class Solution(object):
    def threeSum(self, nums):
        if len(nums) < 3:
            return []
        nums.sort()
        ret = []
        for a in range(len(nums) - 2):
            if a > 0 and nums[a - 1] == nums[a]:
                continue
            sum = 0 - nums[a]
            left = a + 1
            right = len(nums) - 1
            while left < right:
                if nums[left] + nums[right] == sum:
                    ret.append([nums[a], nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1
                    left += 1
                    right -= 1
                elif nums[left] + nums[right] < sum:
                    left += 1
                else:
                    right -= 1
        return ret


print Solution().threeSum([-1,0,1,2,-1,-4])
print Solution().threeSum([0, 0, 0])
print Solution().threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])