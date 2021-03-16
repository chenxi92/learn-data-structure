# coding: utf-8

# https://leetcode.com/problems/minimum-path-sum/

# Given a m x n grid filled with non-negative numbers, find a path from top
# left to bottom right, which minimizes the sum of all numbers along its path.
# Note: You can only move either down or right at any point in time.

# Constraints:
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 200
# 0 <= grid[i][j] <= 100


class Solution(object):
    def minPathSum(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        m = len(grid)
        n = len(grid[0])
        ans = []
        for i in range(m):
            ans.append([])
            for j in range(n):
                ans[i].append(grid[0][0])
        for i in range(1, m):
            ans[i][0] = ans[i - 1][0] + grid[i][0]
        for j in range(1, n):
            ans[0][j] = ans[0][j - 1] + grid[0][j]
        for i in range(1, m):
            for j in range(1, n):
                ans[i][j] = min(ans[i - 1][j], ans[i][j - 1]) + grid[i][j]
        for x in ans:
            print x
        return ans[m - 1][n - 1]

    def minPathSum1(self, grid):
        m = len(grid)
        n = len(grid[0])
        cur = []
        for i in range(m):
            cur.append(grid[0][0])
        for i in range(1, m):
            cur[i] = cur[i - 1] + grid[i][0]
        for j in range(1, n):
            cur[0] += grid[0][j]
            for i in range(1, m):
                cur[i] = min(cur[i - 1], cur[i]) + grid[i][j]
        return cur[m - 1]


grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
for x in grid:
    print x
print "--- 0 ---"
print Solution().minPathSum(grid)
print "--- 1 ---"
print Solution().minPathSum1(grid)

