# coding: utf-8

# https://leetcode.com/problems/subsets-ii/

# Given an integer array nums that may contain duplicates, return all possible
# subsets (the power set). The solution set must not contain duplicate subsets.
# Return the solution in any order.

# Constraints:
# 1 <= nums.length <= 10
# -10 <= nums[i] <= 10


class Solution(object):

    def subsetWithDup1(self, nums):
        results = []
        nums.sort()

        results.append([])
        i = 0
        while i < len(nums):
            dupCount = 0
            while i + 1 < len(nums) and nums[i] == nums[i + 1]:
                dupCount += 1
                i += 1
            size = len(results)
            for j in range(size):
                element = list(results[j])
                for _ in range(dupCount + 1):
                    # 加入当前重复数字
                    element.append(nums[i])
                    newElement = list(element)
                    results.append(newElement)
            i += 1
        return results

    def subsetWithDup2(self, nums):
        results = []
        nums.sort()

        def traceback(path, nums, length, start=0):
            if len(path) == length:
                results.append(path[:])
                return
            for i in range(start, len(nums)):
                if i > start and nums[i] == nums[i - 1]:
                    continue

                path.append(nums[i])

                subNums = nums[:i] + nums[i + 1:]
                traceback(path, subNums, length, i)

                path.pop()

        for k in range(len(nums) + 1):
            traceback([], nums, k)
        return results

    def subsetWithDup3(self, nums):
        results = []
        nums.sort()

        def traceback(path, start):
            results.append(path[:])
            for i in range(start, len(nums)):
                if i > start and nums[i] == nums[i - 1]:
                    continue

                path.append(nums[i])
                traceback(path, start + 1)
                path.pop()

        traceback([], 0)
        return results


nums = [1, 2, 2, 2]
print nums
print "subsetWithDup1", Solution().subsetWithDup1(nums)
print "subsetWithDup2", Solution().subsetWithDup2(nums)
print "subsetWithDup3", Solution().subsetWithDup3(nums)
