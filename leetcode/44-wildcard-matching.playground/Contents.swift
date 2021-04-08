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
}

let s = "abcdb"
let p = ""
print(Solution().isMatch(s, p))
