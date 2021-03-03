import Foundation

/**
 # https://leetcode.com/problems/longest-common-prefix/
 # Write a function to find the longest common prefix string amongst an array of strings.
 # If there is no common prefix, return an empty string "".

 # Constraints:
 # 0 <= strs.length <= 200
 # 0 <= strs[i].length <= 200
 # strs[i] consists of only lower-case English letters.
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        var shortest: String = strs.first!
        for c in strs {
            if c.count < shortest.count {
                shortest = c
            }
        }

        for (i, v) in shortest.enumerated() {
            for other in strs {
                if String(Array(other)[i]) != String(v) {
                    let startIndex = shortest.startIndex
                    let endIndex = shortest.index(startIndex, offsetBy: i)
                    return String(shortest[startIndex..<endIndex])
                }
            }
        }
        return shortest
    }
}

print(Solution().longestCommonPrefix(["flower","flow","flight"]))
print(Solution().longestCommonPrefix(["dog","racecar","car"]))
