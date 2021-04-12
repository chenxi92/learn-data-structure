# coding: utf-8

# https://leetcode.com/problems/permutations-ii/

# Given a collection of numbers, nums, that might contain duplicates,
# return all possible unique permutations in any order.

# Constraints:
# 1 <= nums.length <= 8
# -10 <= nums[i] <= 10


class Solution(object):
    def permuteUnique(self, nums):
        ans = []
        if len(nums) == 0:
            return ans
        ans.append([])
        for num in nums:
            for _ in range(0, len(ans)):
                first = ans[0]
                ans.remove(first)
                for i in range(0, len(first) + 1):
                    temp = list(first)
                    temp.insert(i, num)
                    ans.append(temp)
                    if i < len(first) and first[i] == num:
                        break
        return ans

    def permuteUnique1(self, nums):
        results = []
        counter = {}
        for num in nums:
            if counter.has_key(num):
                counter[num] += 1
            else:
                counter[num] = 1

        def trackback(path, counter):
            if len(path) == len(nums):
                results.append(list(path))
                return

            for num in counter:
                if counter[num] > 0:
                    path.append(num)
                    counter[num] -= 1

                    trackback(path, counter)

                    path.pop()
                    counter[num] += 1

        trackback([], counter)
        return results

    def permuteUnique2(self, nums):
        ans = []
        # 标记是否使用过
        used = [False] * len(nums)
        # 排序
        nums.sort()

        def traceback(path):
            for i in range(len(nums)):
                if len(path) == len(nums):
                    ans.append(path[:])
                    return
                if used[i] is True:
                    continue
                # 减枝
                if i > 0 and nums[i] == nums[i - 1] and not used[i - 1]:
                    continue
                path.append(nums[i])
                used[i] = True
                traceback(path)
                used[i] = False
                # 删除最后一个元素
                path.pop()

        traceback([])
        return ans


nums = [1, 1, 2, 2]
print Solution().permuteUnique(nums[:])
print Solution().permuteUnique1(nums[:])
print Solution().permuteUnique2(nums[:])
