# coding: utf-8

# https://leetcode.com/problems/permutations/

# Given an array nums of distinct integers, return all the possible
# permutations. You can return the answer in any order.

# Constraints:
# 1 <= nums.length <= 6
# -10 <= nums[i] <= 10
# All the integers of nums are unique.

class Solution(object):
    def permute1(self, nums):
        ans = []

        def backtrack(nums, path, rets):
            if not nums:
                rets.append(path)
                return
            for i in range(len(nums)):
                backtrack(nums[:i] + nums[i + 1:], path + [nums[i]], rets)

        backtrack(nums, [], ans)
        return ans

    def permute2(self, nums):
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

    def permute3(self, nums):
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

    def permute4(self, nums):
        ans = []
        # 标记是否使用过
        used = [False for _ in range(len(nums))]

        def traceback(path):
            if len(path) == len(nums):
                ans.append(path[:])
                return
            for i in range(len(nums)):
                if used[i] is True:
                    continue
                path.append(nums[i])
                # print "add:", path
                used[i] = True
                traceback(path)
                used[i] = False
                path.pop()
                # print "  remove:", path

        traceback([])
        return ans


nums = [1, 2, 3]
print "permute1:\n", Solution().permute1(nums[:])
print "\npermute2:\n", Solution().permute2(nums[:])
print "\npermute3:\n", Solution().permute3(nums[:])
print "\npermute4:\n", Solution().permute4(nums[:])
