/**
 https://leetcode.com/problems/palindrome-partitioning/
 
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

 A palindrome string is a string that reads the same backward as forward.
 */
import Foundation

class Solution {
    /// Time Complexity: O(N*2^N), where N is the length of the string s. This is the worst-case time complexity when all the possible substrings are palindrome
    /// Space Complexity: O(N)
    func partition(_ s: String) -> [[String]] {
        var result: [[String]] = []
        dfs(start: 0, result: &result, list: [], str: s)
        return result
    }
    
    private func dfs(start: Int, result: inout [[String]], list: [String], str: String) {
        var currentList: [String] = Array(list)
        
        if start >= str.count {
            result.append(currentList)
        }
        
        for end in start..<str.count {
            if isPalindrome(str, start, end) {
                let subString = str.substring(start: start, to: end + 1)
                currentList.append(subString)
                dfs(start: end + 1, result: &result, list: currentList, str: str)
                currentList.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ str: String, _ low: Int, _ high: Int) -> Bool {
        var left = low
        var right = high
        while left < right {
            if str[left] != str[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    func partition1(_ s: String) -> [[String]] {
        let n = s.count
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
        var result: [[String]] = []
        dfs(&result, s, 0, [], &dp)
        return result
    }
    
    private func dfs(_ result: inout [[String]], _ s: String, _ start: Int, _ list: [String], _ dp: inout [[Bool]]) {
        var currentList = Array(list)
        
        if start >= s.count {
            result.append(currentList)
        }
        
        for end in stride(from: start, to: s.count, by: 1) {
            if s[start] == s[end] && (end - start <= 2 || dp[start + 1][end - 1]) {
                dp[start][end] = true

                let substring = s.substring(start: start, to: end + 1)
                
                currentList.append(substring)
                dfs(&result, s, end + 1, currentList, &dp)
                currentList.removeLast()
            }
        }
    }
}

extension String {
    subscript(_ index: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: index)
        return String(self[start])
    }
        
    /// Find the substring
    /// - Parameters:
    ///   - start: The starting index for the substring.
    ///   - end: An end value to limit the index. end will not include.
    /// - Returns: The substring
    func substring(start: Int, to end: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: start)
        let endIndex = index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }
}

let s = "aab"

Solution().partition(s).forEach { print($0) }
print("\n---\n")
Solution().partition1(s).forEach { print($0) }
