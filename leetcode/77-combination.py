# coding: utf-8

# https://leetcode.com/problems/combinations/

# Given two integers n and k, return all possible combinations of k
# numbers out of 1 ... n.
# You may return the answer in any order.
# Constraints:
# 1 <= n <= 20
# 1 <= k <= n

class Solution(object):

    def combine1(self, n, k):
        ans = []

        def traceback(path, begin):
            if len(path) == k:
                ans.append(path[:])
                return
            for i in range(begin, n + 1):
                path.append(i)
                traceback(path, i + 1)
                path.pop()

        traceback([], 1)
        return ans

    def combine2(self, n, k):
        ans = []

        def traceback(path, begin):
            if len(path) == k:
                ans.append(path[:])
                return
            # 优化取值范围 [begin, n - (k - len(path)) + 1]
            for i in range(begin, n - (k - len(path)) + 2):
                path.append(i)
                traceback(path, i + 1)
                path.pop()

        traceback([], 1)
        return ans


print Solution().combine1(4, 2)
print Solution().combine2(4, 2)
