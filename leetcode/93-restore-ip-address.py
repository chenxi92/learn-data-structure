# coding: utf-8

# https://leetcode.com/problems/restore-ip-addresses/

# Given a string s containing only digits, return all possible valid IP
# addresses that can be obtained from s. You can return them in any order.

# Constraints:
# 0 <= s.length <= 3000
# s consists of digits only.


class Solution(object):
    def restoreIpAddress(self, s):
        ans = []
        if len(s) < 4 or len(s) > 12:
            return ans
        for a in range(1, 4):
            for b in range(1, 4):
                for c in range(1, 4):
                    for d in range(1, 4):
                        if a + b + c + d != len(s):
                            continue
                        start = 0
                        end = a
                        A = int(s[start: end])

                        start = end
                        end += b
                        B = int(s[start: end])

                        start = end
                        end += c
                        C = int(s[start: end])

                        start = end
                        end += d
                        D = int(s[start: end])
                        if A <= 255 and B <= 255 and C <= 255 and D <= 255:
                            path = str(A) + "." + str(B) + "." + \
                                str(C) + "." + str(D)
                            if len(path) == len(s) + 3:
                                ans.append(path)

        return ans

    def restoreIpAddress1(self, s):
        ans = []

        def dfs(s, count, path):
            if count > 4:
                return
            if count == 4 and len(s) < 1:
                ans.append(path[: -1])
                return
            for i in range(1, len(s) + 1):
                if s[: i] == "0" or (s[0] != "0" and 0 < int(s[: i]) < 256):
                    dfs(s[i:], count + 1, path + s[: i] + ".")

        dfs(s, 0, "")
        return ans


print Solution().restoreIpAddress("25525511135")
print Solution().restoreIpAddress("0000")
print Solution().restoreIpAddress("1111")
print Solution().restoreIpAddress("010010")
print Solution().restoreIpAddress1("010010")
print Solution().restoreIpAddress("101023")
print Solution().restoreIpAddress1("101023")
