import Foundation

/**
 # https://leetcode.com/problems/implement-strstr/

 # Implement strStr().
 # Return the index of the first occurrence of needle in haystack,
 # or -1 if needle is not part of haystack.

 # Clarification:
 # What should we return when needle is an empty string?
 # This is a great question to ask during an interview.
 # For the purpose of this problem ,
 # we will return 0 when needle is an empty string.
 # This is consistent to C's strstr() and Java's indexOf().
 */


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        let n = haystack.count
        let L = needle.count
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        var pn: Int = 0
        while pn < n - L + 1 {
            while pn < n - L + 1 && haystackArray[pn] != needleArray[0] {
                pn += 1
            }

            var pL = 0
            var curLen = 0
            while pn < n && pL < L && haystackArray[pn] == needleArray[pL] {
                pn += 1
                pL += 1
                curLen += 1
                
            }
            if curLen == L {
                return pn - curLen
            }
            pn = pn - curLen + 1
        }
        return -1
    }
}

print(Solution().strStr("hello", "ll"))
