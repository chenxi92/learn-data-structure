# coding: utf-8

# https://leetcode.com/problems/sqrtx/
# Given a non-negative integer x, compute and return the square root of x.
# Since the return type is an integer, the decimal digits are truncated,
# and only the integer part of the result is returned.

# Constraints:
# 0 <= x <= 231 - 1


class Solution(object):
    def mySqrt(self, x):
        """
        :type: x: int
        :rtype: int
        """
        l, r, ans = 0, x, -1
        while l <= r:
            mid = (l + r) / 2
            if mid * mid <= x:
                ans = mid
                l = mid + 1
            else:
                r = mid - 1
        return ans


print Solution().mySqrt(8)
print Solution().mySqrt(9)
print Solution().mySqrt(4)

