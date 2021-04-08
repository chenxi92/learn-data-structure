import UIKit

/**
 # https://leetcode.com/problems/wildcard-matching/

 # Given an input string (s) and a pattern (p), implement wildcard pattern
 # matching with support for '?' and '*' where:
 # '?' Matches any single character.
 # '*' Matches any sequence of characters (including the empty sequence).
 # The matching should cover the entire input string (not partial).

 # Constraints:
 # 0 <= s.length, p.length <= 2000
 # s contains only lowercase English letters.
 # p contains only lowercase English letters, '?' or '*'.
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if s.count == 0 {
            var allStar = true
            for c in p {
                if c != "*" {
                    allStar = false
                    break
                }
            }
            return allStar
        }
        if p.count == 0 {
            return false
        }
        let sArray = Array(s)
        let pArray = Array(p)
        let m = s.count + 1
        let n = p.count + 1
        var dp = Array(repeating: Array(repeating: false, count: m), count: n)
        dp[0][0] = true
        /// p 开头是 *
        if pArray[0] == "*" {
            dp[1] = Array(repeating: true, count: m)
        }
        for i in 1..<n {
            var path = false
            for j in 1..<m {
                if pArray[i - 1] == "*" {
                    /// 上一行是 *
                    if dp[i - 1][0] == true {
                        dp[i] = Array(repeating: true, count: m)
                    } 
                    /// 正上方是 *
                    if dp[i - 1][j] == true {
                        path = true
                    }
                    if path == true {
                        dp[i][j] = true
                    }
                } else if pArray[i - 1] == "?" || pArray[i - 1] == sArray[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                }
            }
        }
        return dp[n - 1][m - 1]
    }
    
    func isMatch1(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s)
        let pArray = Array(p)
        let m = s.count + 1
        let n = p.count + 1
        /// dp[i][j] 表示s第i个字符和p的第j个字符匹配
        var dp = Array(repeating: Array(repeating: false, count: n), count: m)
        dp[0][0] = true
        // s 为空， p全部为*才匹配
        for j in stride(from: 1, to: n, by: 1) {
            dp[0][j] = dp[0][j - 1] && pArray[j - 1] == "*"
        }
        for i in stride(from: 1, to: m, by: 1) {
            for j in stride(from: 1, to: n, by: 1) {
                if pArray[j - 1] == "?" || pArray[j - 1] == sArray[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pArray[j - 1] == "*" {
                    /// dp[i - 1][j] 表示 p[j - 1] 匹配空字符串
                    /// dp[i - 1][j] 表示 p[j - 1] 匹配任意字符串
                    dp[i][j] = dp[i - 1][j] || dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
}

let s = "abcdb"
let p = "**"
print(Solution().isMatch(s, p))
print(Solution().isMatch1(s, p))
