# coding: utf-8

# https://leetcode.com/problems/subsets/
# Given an integer array nums of unique elements, return all possible subsets (the power set).
# The solution set must not contain duplicate subsets. Return the solution in any order.

# Constraints:
# 1 <= nums.length <= 10
# -10 <= nums[i] <= 10
# All the numbers of nums are unique.

class Solution(object):
    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        ans = []
        ans.append([])
        for num in nums:
            for i in range(len(ans)):
                ans.append(ans[i] + [num])
        return ans

    def subsets1(self, nums):
        ans = []

        def backtrack(first=0, curr=[]):
            if len(curr) == k:
                ans.append(curr[:])
                return
            for i in range(first, len(nums)):
                curr.append(nums[i])

                backtrack(i + 1, curr)

                curr.pop()

        for k in range(len(nums) + 1):
            backtrack()
        return ans

    def subsets2(self, nums):
        n = len(nums)
        output = []
        for i in range(1 << n):
            # generate bitmask, from 0..00 to 1..11
            bitmask = bin(i | 1 << n)[3:]

            # append subset corresponding to that bitmask
            output.append([nums[j] for j in range(n) if bitmask[j] == '1'])
        return output


nums = [1, 2, 3]
print Solution().subsets(nums)
print Solution().subsets1(nums)
print Solution().subsets2([0])

n = 1
nth_bit = 1 << n
# 000001000
# 000000001
# printnth_bit
# for i in range(2**n):
#     print
# i, bin(i | nth_bit)
