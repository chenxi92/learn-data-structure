import Foundation

/**
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
 */

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var ans: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        ans[0][0] = 1
        /// fill first row
        for i in 1..<m {
            if obstacleGrid[i][0] == 0 && ans[i - 1][0] == 1 {
                ans[i][0] = 1
            }
        }
        /// fill first column
        for j in 1..<n {
            if obstacleGrid[0][j] == 0 && ans[0][j - 1] == 1 {
                ans[0][j] = 1
            }
        }
        /// fill from (1, 1)
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 0 {
                    ans[i][j] = ans[i - 1][j] + ans[i][j - 1]
                } else {
                    ans[i][j] = 0
                }
            }
        }
        return ans[m - 1][n - 1]
    }
    
    func uniquePathsWithObstacles1(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp: [Int] = Array(repeating: 0, count: n)
        dp[0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    dp[j] = 0
                } else if j > 0 {
                    dp[j] += dp[j - 1]
                }
                print(i, j, dp)
            }
        }
        return dp[n - 1]
    }
}

var obstacleGrid = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
obstacleGrid = [[0, 0], [1, 1], [0, 0]]
//obstacleGrid = [[1, 0, 0]]
//obstacleGrid = [[0,1,0,0,0],[1,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
for item in obstacleGrid {
    print(item)
}
print("--- 0 ---")
print(Solution().uniquePathsWithObstacles(obstacleGrid))

print("--- 1 ---")

print(Solution().uniquePathsWithObstacles1(obstacleGrid))
