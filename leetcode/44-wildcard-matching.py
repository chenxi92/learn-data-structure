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

    def isMatch1(self, s, p):
        m = len(s) + 1
        n = len(p) + 1
        dp = [[False] * n for _ in range(m)]
        dp[0][0] = True
        # if s is empty, only p is all * match
        for j in range(1, n):
            dp[0][j] = dp[0][j - 1] and p[j - 1] == "*"
        for i in range(1, m):
            for j in range(1, n):
                if p[j - 1] == s[i - 1] or p[j - 1] == "?":
                    dp[i][j] = dp[i - 1][j - 1]
                elif p[j - 1] == "*":
                    # dp[i - 1][j] match any character
                    # dp[i][j - 1] match empty
                    dp[i][j] = dp[i - 1][j] or dp[i][j - 1]
        return dp[m - 1][n - 1]


s = "adceb"
p = "*a*b"
# s = ""
# p = "****"
print "{} match {}".format(s, p)
print Solution().isMatch(s, p)
print Solution().isMatch1(s, p)
