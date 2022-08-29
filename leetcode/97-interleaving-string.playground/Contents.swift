/**
 https://leetcode.com/problems/interleaving-string/
 
 Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.

 An interleaving of two strings s and t is a configuration where s and t are divided into n and m non-empty substrings respectively, such that:

 s = s1 + s2 + ... + sn
 t = t1 + t2 + ... + tm
 |n - m| <= 1
 The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
 Note: a + b is the concatenation of strings a and b.
 */
import Foundation

class Solution {
    /// Time complexity: O(2^m+n)
    /// Space complexity: O(m + n)
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        return isInterleave(s1, 0, s2, 0, "", s3)
    }

    private func isInterleave(_ s1: String, _ i: Int, _ s2: String, _ j: Int, _ res: String, _ s3: String) -> Bool {
        if res == s3 && i == s1.count && j == s2.count {
            return true
        }
        if i < s1.count && isInterleave(s1, i + 1, s2, j, res + s1[i], s3) == true {
            return true
        }
        
        if j < s2.count && isInterleave(s1, i, s2, j + 1, res + s2[j], s3) == true {
            return true
        }
        return false
    }
    
    func isInterleave1(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        guard !s1.isEmpty else { return true }
        
        var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: s2.count), count: s1.count)
        return isInterleave(s1, 0, s2, 0, s3, 0, &memo)
    }
    
    private func isInterleave(_ s1: String, _ i: Int, _ s2: String, _ j: Int, _ s3: String, _ k: Int, _ memo: inout [[Int]]) -> Bool {
        if i == s1.count {
            return s2[j] == s3[k]
        }
        if j == s2.count {
            return s1[i] == s3[k]
        }
        if memo[i][j] >= 0 {
            return memo[i][j] == 1 ? true : false
        }
        var answer = false
        let isS1Match = (s3[k] == s1[i]) && isInterleave(s1, i + 1, s2, j,     s3, k + 1, &memo)
        let isS2Match = (s3[k] == s2[j]) && isInterleave(s1, i,     s2, j + 1, s3, k + 1, &memo)
        if isS1Match || isS2Match {
            answer = true
        }
        memo[i][j] = answer ? 1 : 0
        return answer
    }
    
    func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        let n = s1.count
        let m = s2.count
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
        for i in stride(from: 0, through: n, by: 1) {
            for j in stride(from: 0, through: m, by: 1) {
                let k = (i + j - 1)
                if (i == 0 && j == 0) {
                    dp[i][j] = true
                } else if (i == 0) {
                    dp[i][j] = dp[i][j - 1] && s2[j - 1] == s3[k]
                } else if (j == 0) {
                    dp[i][j] = dp[i - 1][j] && s1[i - 1] == s3[k]
                } else {
                    let v1 = dp[i - 1][j] && s1[i - 1] == s3[k]
                    let v2 = dp[i][j - 1] && s2[j - 1] == s3[k]
                    dp[i][j] = (v1 || v2)
                }
            }
        }
        return dp[n][m]
    }
    
    func isInterleave3(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        let n = s1.count
        let m = s2.count
        var dp: [Bool] = Array(repeating: false, count: m + 1)
        for i in stride(from: 0, through: n, by: 1) {
            for j in stride(from: 0, through: m, by: 1) {
                let k = (i + j - 1)
                if (i == 0 && j == 0) {
                    dp[j] = true
                } else if (i == 0) {
                    dp[j] = (s2[j - 1] == s3[k]) && dp[j - 1]
                } else if (j == 0) {
                    dp[j] = (s1[i - 1] == s3[k]) && dp[j]
                } else {
                    let v1 = (s1[i - 1] == s3[k]) && dp[j]
                    let v2 = (s2[j - 1] == s3[k]) && dp[j - 1]
                    dp[j] = (v1 || v2)
                }
            }
        }
        return dp[m]
    }
}

extension String {
    subscript(_ i: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: i)
        return String(self[index])
    }
}

var s1 = "aabcc"
var s2 = "dbbca"
var s3 = "aadbbcbcac"
assert(Solution().isInterleave(s1, s2, s3) == true)
assert(Solution().isInterleave1(s1, s2, s3) == true)
assert(Solution().isInterleave2(s1, s2, s3) == true)
assert(Solution().isInterleave3(s1, s2, s3) == true)

s1 = "aabcc"
s2 = "dbbca"
s3 = "aadbbbaccc"
assert(Solution().isInterleave(s1, s2, s3) == false)
assert(Solution().isInterleave1(s1, s2, s3) == false)
assert(Solution().isInterleave2(s1, s2, s3) == false)
assert(Solution().isInterleave3(s1, s2, s3) == false)

s1 = ""
s2 = ""
s3 = ""
assert(Solution().isInterleave(s1, s2, s3) == true)
assert(Solution().isInterleave1(s1, s2, s3) == true)
assert(Solution().isInterleave2(s1, s2, s3) == true)
assert(Solution().isInterleave3(s1, s2, s3) == true)

s1 = "a"
s2 = ""
s3 = "c"
assert(Solution().isInterleave2(s1, s2, s3) == false)
assert(Solution().isInterleave3(s1, s2, s3) == false)

print("passed test")
