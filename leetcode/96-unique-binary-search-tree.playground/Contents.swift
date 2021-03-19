import Foundation

/**
 # https://leetcode.com/problems/unique-binary-search-trees

 # Given an integer n, return the number of structurally unique BST's (binary
 # search trees) which has exactly n nodes of unique values from 1 to n.

 # Constraints:
 # 1 <= n <= 19
 */

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n < 1 {
            return 1
        }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for level in 2...n {
            for root in 1...level {
                dp[level] += dp[root - 1] * dp[level - root]
            }
        }
        return dp[n]
    }
}

let n = 1
print(Solution().numTrees(n))
