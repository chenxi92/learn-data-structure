# coding: utf-8

# https://leetcode.com/problems/longest-common-prefix/
# Write a function to find the longest common prefix string amongst an array of strings.
# If there is no common prefix, return an empty string "".

# Constraints:
# 0 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lower-case English letters.

class Solution(object):
    def longestCommonPrefix(self, strs):
        if not strs:
            return ""
        shortest = min(strs, key=len)
        for (i, v) in enumerate(shortest):
            for other in strs:
                if other[i] != v:
                    return shortest[:i]
        return shortest

print Solution().longestCommonPrefix(["flower","flow","flight"])
print Solution().longestCommonPrefix(["dog","racecar","car"])