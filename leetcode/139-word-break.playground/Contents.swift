/**
 https://leetcode.com/problems/word-break/
 
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.
 */
import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard !wordDict.isEmpty else { return false }
        
        var dp: [Bool] = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        /// For each substring, j means start index, i means end index
        for i in 1...s.count {
            for j in 0..<i {
                if dp[j] && wordDict.contains(s[j, i]) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
}

extension String {
    subscript(_ start: Int, _ end: Int) -> String {
        let begin = index(self.startIndex, offsetBy: start)
        let end = index(self.startIndex, offsetBy: end)
        return String(self[begin..<end])
    }
}

var s = "leetcode"
var wordDic = ["leet", "code"]
assert(Solution().wordBreak(s, wordDic))

s = "applepenapple"
wordDic = ["apple", "pen"]
assert(Solution().wordBreak(s, wordDic))

print("passed the test")
