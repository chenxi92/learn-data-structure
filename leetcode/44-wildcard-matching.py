# coding: utf-8

# https://leetcode.com/problems/wildcard-matching/

# Given an input string (s) and a pattern (p), implement wildcard pattern
# matching with support for '?' and '*' where:
# '?' Matches any single character.
# '*' Matches any sequence of characters (including the empty sequence).
# The matching should cover the entire input string (not partial).

# Constraints:
# 0 <= s.length, p.length <= 2000
# s contains only lowercase English letters.
# p contains only lowercase English letters, '?' or '*'.


class Solution(object):
    def isMatch(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: bool
        """
        if len(s) == 0:
            allStar = True
            for c in p:
                if c != "*":
                    allStar = False
                    break
            return allStar
        m = len(s) + 1
        n = len(p) + 1
        dp = [[False] * m for i in range(n)]
        dp[0][0] = True
        if p.startswith("*"):
            dp[1] = [True] * m
        for i in range(1, n):
            path = False
            for j in range(1, m):
                if p[i - 1] == "*":
                    if dp[i - 1][0] == True:
                        dp[i] = [True] * m
                    if dp[i - 1][j]:
                        path = True
                    if path:
                        dp[i][j] = True
                elif p[i - 1] == "?" or p[i - 1] == s[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
        for item in dp:
            print item
        return dp[n - 1][m - 1]


s = "adceb"
p = "*a*b"
# s = ""
# p = "***a"
print "{} match {}".format(s, p)
print Solution().isMatch(s, p)
