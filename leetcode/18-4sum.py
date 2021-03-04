# coding: utf-8

# https://leetcode.com/problems/4sum/

# Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target?
# Find all unique quadruplets in the array which gives the sum of target.
# Notice that the solution set must not contain duplicate quadruplets.

# Constraints:
# 0 <= nums.length <= 200
# -109 <= nums[i] <= 109
# -109 <= target <= 109

class Solution(object):
    def threeSum(self, nums, target):
        if len(nums) < 3:
            return []
        result = []
        for i in range(len(nums) - 2):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            left = i + 1
            right = len(nums) - 1
            while left < right:
                sum = nums[i] + nums[left] + nums[right]
                if sum == target:
                    result.append([nums[i], nums[left], nums[right]])
                    while left < right and left + 1 < len(nums) and nums[left] == nums[left + 1]:
                        left += 1
                    while left < right and right > 0 and nums[right] == nums[right - 1]:
                        right -= 1
                    left += 1
                    right -= 1
                elif sum > target:
                    right -= 1
                else:
                    left += 1
        return result

    def fourSum(self, nums, target):
        if len(nums) < 4:
            return []
        nums.sort()

        output = []
        for i in range(len(nums) - 3):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            results = self.threeSum(nums[i + 1:], target - nums[i])
            for result in results:
                result.insert(0, nums[i])
                output.append(result)
        return output

    def fourSum1(self, nums, target):
        def kSum(nums, target, k):
            res = []
            if len(nums) == 0 or (nums[0] * k > target) or (target > nums[-1] * k):
                return res
            if k == 2:
                return twoSum(nums, target)

            for i in range(len(nums)):
                if i == 0 or nums[i - 1] != nums[i]:
                    kSumResult = kSum(nums[i + 1:], target - nums[i], k - 1)
                    for kRes in kSumResult:
                        kRes.insert(0, nums[i])
                        res.append(kRes)
            return res

        def twoSum(nums, target):
            res = []
            left, right = 0, len(nums) - 1
            while left < right:
                sum = nums[left] + nums[right]
                if sum == target:
                    res.append([nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1
                    left += 1
                    right -= 1
                elif sum > target:
                    right -= 1
                else:
                    left += 1
            return res

        nums.sort()
        return kSum(nums, target, 4)
    
    # Hash Set
    def fourSum2(self, nums, target):
        def kSum(nums, target, k):
            res = []
            if len(nums) == 0 or (nums[0] * k > target) or (target > nums[-1] * k):
                return res
            if k == 2:
                return twoSum(nums, target)

            for i in range(len(nums)):
                if i == 0 or nums[i - 1] != nums[i]:
                    kSumResult = kSum(nums[i + 1:], target - nums[i], k - 1)
                    for kRes in kSumResult:
                        kRes.insert(0, nums[i])
                        res.append(kRes)
            return res

        def twoSum(nums, target):
            res = []
            s = set()
            for i in range(len(nums)):
                if len(res) == 0 or res[-1][1] != nums[i]:
                    if target - nums[i] in s:
                        res.append([target - nums[i], nums[i]])
                s.add(nums[i])
            return res

        nums.sort()
        return kSum(nums, target, 4)


print Solution().fourSum([1, 0, -1, 0, -2, 2], 0)
print Solution().fourSum([-2, -1, -1, 1, 1, 2, 2], 0)

print Solution().fourSum1([1, 0, -1, 0, -2, 2], 0)
print Solution().fourSum1([-2, -1, -1, 1, 1, 2, 2], 0)

print Solution().fourSum2([1, 0, -1, 0, -2, 2], 0)
print Solution().fourSum2([-2, -1, -1, 1, 1, 2, 2], 0)