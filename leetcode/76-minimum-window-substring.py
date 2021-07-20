# coding: utf-8

# https://leetcode.com/problems/minimum-window-substring/

# Given two strings s and t of lengths m and n respectively,
# return the minimum window substring of s such that every character
# in t (including duplicates) is included in the window.
# If there is no such substring, return the empty string "".

# The testcases will be generated such that the answer is unique.
# A substring is a contiguous sequence of characters within the string.

# Constraints:

# m == s.length
# n == t.length
# 1 <= m, n <= 105
# s and t consist of uppercase and lowercase English letters.

class Solution(object):
    def minWindow(slef, s, t):
        window = {}
        need = {}
        for c in t:
            if need.has_key(c):
                need[c] += 1
            else:
                need[c] = 1
            window[c] = 0

        left = right = 0
        valid = 0
        start = 0
        length = float('inf')
        while (right < len(s)):
            c = s[right]
            right += 1
            if need.has_key(c):
                window[c] += 1
                if window[c] == need[c]:
                    valid += 1
            while valid == len(need):
                if right - left < length:
                    start = left
                    length = right - left

                d = s[left]
                left += 1
                if need.has_key(d):
                    if window[d] == need[d]:
                        valid -= 1
                    window[d] -= 1
        if length == float('inf'):
            return ""
        else:
            return s[start: start + length]


s = "ebbancf"
t = "abc"
print s
print t
print Solution().minWindow(s, t)
