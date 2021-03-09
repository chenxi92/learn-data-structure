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

        def trackback(comb, counter):
            if len(comb) == len(nums):
                results.append(list(comb))
                return

            for num in counter:
                if counter[num] > 0:
                    comb.append(num)
                    counter[num] -= 1

                    trackback(comb, counter)

                    comb.pop()
                    counter[num] += 1

        trackback([], counter)
        return results


nums = [1, 1, 2]
print Solution().permuteUnique(nums)
print Solution().permuteUnique1(nums)
