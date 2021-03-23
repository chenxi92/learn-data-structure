import UIKit

/**
 # https://leetcode.com/problems/regular-expression-matching
 # Given an input string (s) and a pattern (p), implement regular expression
 # matching with support for '.' and '*' where:
 #     '.' Matches any single character.
 #     '*' Matches zero or more of the preceding element.
 # The matching should cover the entire input string (not partial).

 # Constraints:
 # 0 <= s.length <= 20
 # 0 <= p.length <= 30
 # s contains only lowercase English letters.
 # p contains only lowercase English letters, '.', and '*'.
 # It is guaranteed for each appearance of the character '*',
 # there will be a previous valid character to match.
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s)
        let pArray = Array(p)
        // dp[i][j] 表示s中i个字符和p中j个字符匹配
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: pArray.count + 1), count: sArray.count + 1)
        /// s，p均为空串，匹配
        dp[0][0] = true
        /// s为空，p不为空，匹配情况
        for j in stride(from: 1, through: p.count, by: 1) {
            if pArray[j - 1] == "*" {
                dp[0][j] = dp[0][j - 2]
            }
        }
        for i in stride(from: 1, through: s.count, by: 1){
            for j in stride(from: 1, through: p.count, by: 1) {
                /// p 中第 j 个字符 与 s 中第 i 个字符相等
                /// p 中第 j 个字符为 .
                if pArray[j - 1] == sArray[i - 1] || pArray[j - 1] == "." {
                    dp[i][j] = dp[i - 1][j - 1]
                
                    /// p 中第 j 个字符为 *
                } else if pArray[j - 1] == "*" {
                    /// s 中第 i 个字符与 p 中第 j - 1 个字符相等
                    /// p 中第 j - 1 个字符为 .
                    if sArray[i - 1] == pArray[j - 2] || pArray[j - 2] == "." {
                        /// p 中配置 [j - 1, j] 字符 0 次, dp[i][j - 2]
                        /// p 中配置 [j - 1, j] 字符 1 次, dp[i - 1][j - 2]
                        /// p 中配置 [j - 1, j] 字符 >1 次, dp[i - 1][j]
                        dp[i][j] = dp[i][j - 2] || dp[i - 1][j - 2] || dp[i - 1][j]
                    } else {
                        /// p 中配置 [j - 1, j] 字符 0 次
                        dp[i][j] = dp[i][j - 2]
                    }
                }
            }
        }
        return dp[sArray.count][pArray.count]
    }
}

let s = "aa"
let p = "aab*"
print("match: s =", s, "p =", p)
print(Solution().isMatch(s, p))
