# coding:utf-8

# https://leetcode.com/problems/regular-expression-matching
# Given an input string (s) and a pattern (p), implement regular expression
# matching with support for '.' and '*' where:
# 	'.' Matches any single character.​​​​
# 	'*' Matches zero or more of the preceding element.
# The matching should cover the entire input string (not partial).

# Constraints:
# 0 <= s.length <= 20
# 0 <= p.length <= 30
# s contains only lowercase English letters.
# p contains only lowercase English letters, '.', and '*'.
# It is guaranteed for each appearance of the character '*',
# there will be a previous valid character to match.


class Solution(object):
    def isMatch(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: bool
        """
        def matches(i, j):
            if i == 0:
                return False
            if p[j - 1] == '.':
                return True
            return s[i - 1] == p[j - 1]

        m, n = len(s), len(p)
        f = [[False] * (n + 1) for _ in range(m + 1)]
        f[0][0] = True
        for i in range(m + 1):
            for j in range(1, n + 1):
                if p[j - 1] == "*":
                    # match 0 times, ab : abc*
                    f[i][j] = f[i][j - 2]
                    if matches(i, j - 1):
                        # match >= 1 times
                        f[i][j] |= f[i - 1][j]
                else:
                    if matches(i, j):
                        f[i][j] = f[i - 1][j - 1]
        #     print i, f[i]
        # print "---"
        # for x in f:
        #     print x
        return f[m][n]

    def isMatch1(self, s, p):
        if len(s) < 1 and len(p) < 1:
            return True
        m, n = len(s), len(p)
        # dp[i][j] 表示s中i个字符和p中j个字符匹配
        dp = [[False] * (n + 1) for _ in range(m + 1)]
        # s，p均为空串，匹配
        dp[0][0] = True
        # s为空，p不为空，匹配情况
        for j in range(1, n + 1):
            if p[j - 1] == "*":
                dp[0][j] = dp[0][j - 2]
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                # p 中第 j 个字符 与 s 中第 i 个字符相等
                # p 中第 j 个字符为 .
                if s[i - 1] == p[j - 1] or p[j - 1] == ".":
                    dp[i][j] = dp[i - 1][j - 1]
                # p 中第 j 个字符为 *
                elif p[j - 1] == "*":
                    # s 中第 i 个字符与 p 中第 j - 1 个字符相等
                    # p 中第 j - 1 个字符为 .
                    if s[i - 1] == p[j - 2] or p[j - 2] == ".":
                        # p 中配置 [j - 1, j] 字符 0 次, dp[i][j - 2]
                        # p 中配置 [j - 1, j] 字符 1 次, dp[i - 1][j - 2]
                        # p 中配置 [j - 1, j] 字符 >1 次, dp[i - 1][j]
                        dp[i][j] = dp[i][j - 2] or dp[i - 1][j - 2] or dp[i - 1][j]
                    else:
                        # p 中配置 [j - 1, j] 字符 0 次
                        dp[i][j] = dp[i][j - 2]
        return dp[m][n]


s = "ab"
p = "abc*"
print "s: {}, p: {}".format(s, p)
print Solution().isMatch(s, p)
print Solution().isMatch1(s, p)
