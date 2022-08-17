/**
 https://leetcode.com/problems/edit-distance/
 
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

 You have the following three operations permitted on a word:
    Insert a character
    Delete a character
    Replace a character
 */
import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        
        // dp[i][j] to be minimum number of operations to convert word1[0...i] to word2[0...j]
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
   
        // convert string to empty
        for i in stride(from: 1, through: m, by: 1) {
            dp[i][0] = i
        }
        // convert empty to string
        for j in stride(from: 1, through: n, by: 1) {
            dp[0][j] = j
        }
        
        for i in stride(from: 1, through: m, by: 1) {
            for j in stride(from: 1, through:n , by: 1) {
                if word1[i - 1] == word2[j - 1] {
                    // no more operations needed
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    /**
                     1. replace word1[i - 1] by word2[j - 1]
                        => dp[i][j] = dp[i - 1][j - 1] + 1
                     2. if word1[0..i - 1] == word2[0...j], then delete word1[i - 1]
                        => dp[i][j] = dp[i - 1][j] + 1
                     3. if word1[0...i] + word2[j - 1] = word2[...j], then insert word2[j - 1] to word1 [0...i]
                        => dp[i][j] = dp[i][j - 1] + 1
                     */
                    let replace = dp[i - 1][j - 1] + 1
                    let delete = dp[i - 1][j] + 1
                    let insert = dp[i][j - 1] + 1
                    dp[i][j] = min(replace, min(delete, insert))
                }
            }
        }
        
        return dp[m][n]
    }
}

extension String {
    subscript(i: Int) -> String {
        guard i < self.count else { return "" }
        let idx = index(startIndex, offsetBy: i)
        return String(self[idx])
    }
}

let step1 = Solution().minDistance("horse", "ros")
assert(step1 == 3, "excepte 3, but return \(step1)")

let step2 = Solution().minDistance("intention", "execution")
assert(step2 == 5, "excepte 5, but return \(step2)")

print("\nfinished test\n")
