# coding: utf-8

# https://leetcode.com/problems/permutations/

# Given an array nums of distinct integers, return all the possible
# permutations. You can return the answer in any order.

# Constraints:
# 1 <= nums.length <= 6
# -10 <= nums[i] <= 10
# All the integers of nums are unique.

class Solution(object):
    def permute(self, nums):
        ans = []

        def dfs(nums, path, rets):
            if not nums:
                rets.append(path)
                return
            for i in range(len(nums)):
                dfs(nums[:i] + nums[i + 1:], path + [nums[i]], rets)

        dfs(nums, [], ans)
        return ans

    def permute1(self, nums):
        def backtrack(start, end):
            if start == end:
                ans.append(nums[:])
                return
            for i in range(start, end):
                (nums[start], nums[i]) = (nums[i], nums[start])
                backtrack(start + 1, end)
                (nums[start], nums[i]) = (nums[i], nums[start])

        ans = []
        backtrack(0, len(nums))
        return ans

    def permute2(self, nums):
        if len(nums) == 0:
            return []
        ans = []
        # Add element to queue
        ans.append([])
        # loop over input
        for num in nums:
            # loop over current queue size
            for _ in range(0, len(ans)):
                # remove first element from queue
                first = ans[0]
                ans.remove(first)
                # use the removed element
                for i in range(0, len(first) + 1):
                    temp = list(first)
                    temp.insert(i, num)
                    ans.append(temp)
        return ans


nums = [1, 2, 3]
print Solution().permute(nums)

nums1 = [1, 2, 3]
print Solution().permute1(nums1)

nums2 = [1, 2, 3]
print Solution().permute2(nums2)
