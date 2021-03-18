# coding: utf-8

# https://leetcode.com/problems/decode-ways/


class Solution(object):
    def numDecodings(self, s):
        if len(s) == 0:
            return 0
        dp = [0 for i in range(len(s))]
        if s[0] != "0":
            dp[0] = 1
        for i in range(1, len(s)):
            cur = int(s[i])
            prev = int(s[i-1])
            if cur >= 1 and cur <= 9:
                dp[i] += dp[i - 1]
            if (prev == 1 and cur >= 0 and cur <= 9) or (prev == 2 and cur >= 0 and cur <= 6):
                if i >= 2:
                    dp[i] += dp[i - 2]
                else:
                    dp[i] += 1
        return dp[len(s) - 1]


print Solution().numDecodings("112")
