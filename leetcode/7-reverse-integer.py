# coding: utf-8

# https://leetcode.com/problems/reverse-integer/
# Given a signed 32-bit integer x, return x with its digits reversed.
# If reversing x causes the value to go outside the signed 32-bit integer
# range [-231, 231 - 1], then return 0.

class Solution(object):
    def reverse(self, x):
        t = 0
        y = abs(x)
        while y > 0:
            t = (t * 10) + (y % 10)
            if t < -pow(2, 31) or t > pow(2, 31) - 1:
                return 0
            y = (y / 10)
        if x < 0:
            t *= -1
        return t


assert(Solution().reverse(123) == 321)
assert(Solution().reverse(-123) == -321)
assert(Solution().reverse(1534236469) == 0)
assert(Solution().reverse(900000) == 9)
