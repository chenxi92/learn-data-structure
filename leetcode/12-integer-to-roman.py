# coding: utf-8

# https://leetcode.com/problems/integer-to-roman/

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000

# There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.

class Solution(object):
    def intToRoman(self, num):
        """
        :type num: int
        :rtype str: string
        """
        if num < 1 or num > 3999:
            return ""
        m = ["", "M", "MM", "MMM"]
        c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        l = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        return m[num/1000] + c[num % 1000/100] + x[num % 1000 % 100/10] + l[num % 10]

    def intToRoman1(self, num):
        values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        numerals = ["M", "CM", "D", "CD", "C", "XC",
                    "L", "XL", "X", "IX", "V", "IV", "I"]
        ret = ""
        for i, v in enumerate(values):
            ret += (num/v) * numerals[i]
            num %= v
        return ret


print Solution().intToRoman(3)
print Solution().intToRoman(4)
print Solution().intToRoman(9)
print Solution().intToRoman(2994)

print Solution().intToRoman1(3)
print Solution().intToRoman1(4)
print Solution().intToRoman1(9)
print Solution().intToRoman1(2994)
