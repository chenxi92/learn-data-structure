/**
 https://leetcode.com/problems/word-break-ii/
 
 Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.
 */
import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var maxLength = 0
        var hashSet: Set<String> = .init()
        wordDict.forEach { word in
            hashSet.insert(word)
            if word.count > maxLength {
                maxLength = word.count
            }
        }
        var map: [Int: [String]] = [:]
        return dfs(s, maxLength, 0, hashSet, &map)
    }
    
    private func dfs(_ s: String, _ maxLength: Int, _ start: Int, _ hashSet: Set<String>, _ map: inout [Int: [String]]) -> [String] {
        if let value = map[start] {
            return value
        }
        var list: [String] = []
        if (start == s.count) {
            list.append("")
        }
        var i = start
        while i < s.count && i < start + maxLength {
            let sub = s.substring(start, i + 1)
            if hashSet.contains(sub) {
                let nexts: [String] = dfs(s, maxLength, i + 1, hashSet, &map)
                for next in nexts {
                    if next == "" {
                        list.append(sub + next)
                    } else {
                        list.append(sub + " " + next)
                    }
                }
            }
            i += 1
        }
        map[start] = list
        return list
    }
}

extension String {
    subscript(_ i: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: i)
        return String(self[startIndex])
    }
    
    func substring(_ start: Int, _ end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        let result = self[startIndex..<endIndex]
        return String(result)
    }
}

print(Solution().wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"]))
//print(Solution().wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
