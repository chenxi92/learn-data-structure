# coding: utf-8

# https://leetcode.com/problems/unique-paths/

# A robot is located at the top-left corner of a m x n grid (marked 'Start'
# in the diagram below). The robot can only move either down or right at any
# point in time. The robot is trying to reach the bottom-right corner of the
# grid (marked 'Finish' in the diagram below).
# How many possible unique paths are there?

# Constraints:
# 1 <= m, n <= 100
# It's guaranteed that the answer will be less than or equal to 2 * 109

# f(i, j) = f(i - 1, j) + f(i, j - 1)

class Solution(object):
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        ans = []
        for row in range(m):
            ans.append([])
            for col in range(n):
                ans[row].append(0)

        for row in range(m):
            for col in range(n):
                if row > 0 and row > 0:
                    ans[row][col] = ans[row][col - 1] + ans[row - 1][col]
                else:
                    if row == 0:
                        ans[0][col] = 1
                    else:
                        ans[row][0] = 1

        return ans[m - 1][n - 1]


print Solution().uniquePaths(3, 7)
