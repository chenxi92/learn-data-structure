import Foundation

/**
 # https://leetcode.com/problems/minimum-path-sum/

 # Given a m x n grid filled with non-negative numbers, find a path from top
 # left to bottom right, which minimizes the sum of all numbers along its path.
 # Note: You can only move either down or right at any point in time.

 # Constraints:
 # m == grid.length
 # n == grid[i].length
 # 1 <= m, n <= 200
 # 0 <= grid[i][j] <= 100
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var ans: [[Int]] = Array(repeating: Array(repeating: grid[0][0], count: n), count: m)
        for i in 1..<m {
            ans[i][0] = ans[i - 1][0] + grid[i][0]
        }
        for j in 1..<n {
            ans[0][j] = ans[0][j - 1] + grid[0][j]
        }
        for i in 1..<m {
            for j in 1..<n {
                ans[i][j] = min(ans[i - 1][j], ans[i][j - 1]) + grid[i][j]
            }
        }
        return ans[m - 1][n - 1]
    }
    
    func minPathSum1(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var cur: [Int] = Array(repeating: grid[0][0], count: m)
        // 保存第一列加和
        for i in 1..<m {
            cur[i] = cur[i - 1] + grid[i][0]
        }
        for j in 1..<n {
            // 更新每一列的信息
            // cur[i] 代表左侧列的加和
            // cur[i - 1] 代表上一行的加和
            cur[0] += grid[0][j]
            for i in 1..<m {
                cur[i] = min(cur[i], cur[i - 1]) + grid[i][j]
            }
        }
        return cur[m - 1]
    }
}

var grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
grid = [[1, 2], [5, 6], [1, 1]]
for item in grid {
    print(item)
}
print("--- 0 ---")
print(Solution().minPathSum(grid))
print("--- 1 ---")
print(Solution().minPathSum1(grid))
