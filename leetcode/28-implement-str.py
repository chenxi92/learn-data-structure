# coding: utf-8

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


class Solution(object):
    def strStr(self, haystack, needle):
        n, L = len(haystack), len(needle)
        for start in range(n - L + 1):
            if haystack[start: start + L] == needle:
                return start
        return -1

    def strStr1(self, haystack, needle):
        if len(needle) == 0:
            return 0
        L, n = len(needle), len(haystack)
        pn = 0
        while pn < n - L + 1:
            while pn < n - L + 1 and haystack[pn] != needle[0]:
                pn += 1
            curLen = pL = 0
            while pn < n and pL < L and haystack[pn] == needle[pL]:
                pn += 1
                pL += 1
                curLen += 1
            if curLen == L:
                return pn - L
            pn = pn - curLen + 1
        return -1


print Solution().strStr("hello", "ll")
print Solution().strStr1("hello", "ll")

