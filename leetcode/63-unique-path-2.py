# coding: utf-8

# https://leetcode.com/problems/unique-paths-ii/

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in
# the diagram below). The robot can only move either down or right at any
# point in time. The robot is trying to reach the bottom-right corner of the
# grid (marked 'Finish' in the diagram below). Now consider if some obstacles
# are added to the grids. How many unique paths would there be?
# An obstacle and space is marked as 1 and 0 respectively in the grid.

# Constraints:
# m == obstacleGrid.length
# n == obstacleGrid[i].length
# 1 <= m, n <= 100
# obstacleGrid[i][j] is 0 or 1.


class Solution(object):
    def uniquePathsWithObstacles(self, obstacleGrid):
        """
        :type obstacleGrid: List[List[int]]
        :rtype: int
        """
        n = len(obstacleGrid[0])
        dp = []
        for i in range(n):
            dp.append(0)
        dp[0] = 1
        for i in range(len(obstacleGrid)):
            for j in range(n):
                if obstacleGrid[i][j] == 1:
                    dp[j] = 0
                elif j > 0:
                    dp[j] += dp[j - 1]
        return dp[n - 1]

    def uniquePathsWithObstacles1(self, obstacleGrid):
        if obstacleGrid[0][0] == 1:
            return 0
        m = len(obstacleGrid)
        n = len(obstacleGrid[0])
        ans = []
        for i in range(m):
            ans.append([])
            for j in range(n):
                ans[i].append(0)
        ans[0][0] = 1
        for i in range(1, m):
            if obstacleGrid[i][0] == 0 and ans[i - 1][0] == 1:
                ans[i][0] = 1
        for j in range(1, n):
            if obstacleGrid[0][j] == 0 and ans[0][j - 1] == 1:
                ans[0][j] = 1
        for i in range(1, m):
            for j in range(1, n):
                if obstacleGrid[i][j] == 0:
                    ans[i][j] = ans[i - 1][j] + ans[i][j - 1]
                else:
                    ans[i][j] = 0
        for x in ans:
            print x
        return ans[m - 1][n - 1]


obstacleGrid = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
obstacleGrid = [[0, 0], [1, 1], [0, 0]]
# obstacleGrid = [[1, 0, 0]]
for grid in obstacleGrid:
    print grid
print "---"
print Solution().uniquePathsWithObstacles(obstacleGrid)
print "---"
print Solution().uniquePathsWithObstacles1(obstacleGrid)

