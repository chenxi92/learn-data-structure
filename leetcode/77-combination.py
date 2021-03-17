# coding: utf-8

# https://leetcode.com/problems/combinations/

# Given two integers n and k, return all possible combinations of k
# numbers out of 1 ... n.
# You may return the answer in any order.
# Constraints:
# 1 <= n <= 20
# 1 <= k <= n

class Solution(object):
    def combine(self, n, k):
        ans = []

        def dfs(path, start, end, k):
            if k == 0:
                ans.append(path[:])
                return
            for i in range(start, end + 1):
                path.append(i)
                dfs(path, i + 1, end, k - 1)
                path.pop()

        dfs([], 1, n, k)
        return ans


print Solution().combine(4, 2)
