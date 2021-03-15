import Foundation

/**
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
 */

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var ans: [[Int]] = Array(repeating: Array(repeating: 1, count: n), count: m)
        for row in 0..<m {
            for col in 0..<n {
                if row > 0 && col > 0 {
                    ans[row][col] = ans[row - 1][col] + ans[row][col - 1]
                }
            }
        }
        return ans[m - 1][n - 1]
    }
}

print(Solution().uniquePaths(3, 7))
