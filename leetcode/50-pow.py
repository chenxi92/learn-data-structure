# coding: utf-8

# https://leetcode.com/problems/powx-n/
# Implement pow(x, n), which calculates x raised to the power n

# Contraints:
# -100.0 < x < 100.0
# -231 <= n <= 231-1
# -104 <= xn <= 104


class Solution(object):
    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        if x == 0.0:
            return 0.0
        res = 1
        if n < 0:
            x = 1 / x
            n = -n
        while n > 0:
            # 判断是否是奇数
            if n & 1 == 1:
                res *= x
            x *= x
            n >>= 1
        return res


print Solution().myPow(2.0000, 10)
print Solution().myPow(2.0000, -2)
