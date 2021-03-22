# coding: utf-8

# https://leetcode.com/problems/roman-to-integer/
# Roman numerals are represented by seven different symbols:
# I, V, X, L, C, D and M.
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

# Constraints:
# 1 <= s.length <= 15
# s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
# It is guaranteed that s is a valid roman numeral in the range [1, 3999].

class Solution(object):
    def romanToInt(self, s):
        map = {"M": 1000,
               "CM": 900,
               "D": 500,
               "CD": 400,
               "C": 100,
               "XC": 90,
               "L": 50,
               "XL": 40,
               "X": 10,
               "IX": 9,
               "V": 5,
               "IV": 4,
               "I": 1
               }

        ret = 0
        i = 0
        while i < len(s):
            if i + 1 < len(s) and map.has_key(s[i] + s[i + 1]):
                ret += map[s[i] + s[i + 1]]
                i += 1
            else:
                ret += map[s[i]]
            i += 1
        return ret

    def romanToInt1(self, s):
        map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        sum = map[s[len(s) - 1]]
        i = len(s) - 2
        while i >= 0:
            if map[s[i]] < map[s[i + 1]]:
                sum -= map[s[i]]
            else:
                sum += map[s[i]]
            i -= 1
        return sum


print Solution().romanToInt("III")
print Solution().romanToInt("IV")
print Solution().romanToInt("IX")
print Solution().romanToInt("LVIII")
print Solution().romanToInt("MCMXCIV")

print Solution().romanToInt1("III")
print Solution().romanToInt1("IV")
print Solution().romanToInt1("IX")
print Solution().romanToInt1("LVIII")
print Solution().romanToInt1("MCMXCIV")
