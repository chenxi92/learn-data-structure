# coding: utf-8

# https://leetcode.com/problems/string-to-integer-atoi/
# Implement the myAtoi(string s) function, which converts a string to a 32-bit
# signed integer (similar to C/C++'s atoi function).

# The algorithm for myAtoi(string s) is as follows:
# 1. Read in and ignore any leading whitespace.

# 2. Check if the next character (if not already at the end of the string) is
# '-' or '+'. Read this character in if it is either.
# This determines if the final result is negative or positive respectively.
# Assume the result is positive if neither is present.

# 3. Read in next the characters until the next non-digit charcter or the end
# of the input is reached. The rest of the string is ignored.

# 4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32).
# If no digits were read, then the integer is 0.
# Change the sign as necessary (from step 2).

# 5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1],
# then clamp the integer so that it remains in the range.
# Specifically, integers less than -231 should be clamped to -231, and integers
# greater than 231 - 1 should be clamped to 231 - 1.

# 6. Return the integer as the final result.

# Only the space character ' ' is considered a whitespace character.
# Do not ignore any characters other than the leading whitespace or the rest of
# the string after the digits.

class Solution(object):
    def myAtoi(self, s):
        if (len(s) < 1):
            return 0
        sign = 1
        i = 0
        n = len(s)
        while i < n and s[i] == ' ':
            i += 1
        if i < n and (s[i] == '-' or s[i] == '+'):
            if s[i] == '-':
                sign = -1
            i += 1

        result = 0
        max = pow(2, 31) - 1
        min = -pow(2, 31)
        while i < n and s[i].isdigit():
            result = (result * 10) + int(s[i])
            if result > max:
                if sign == 1:
                    return max
                else:
                    return min
            i += 1
        return result * sign


print Solution().myAtoi("42")
print Solution().myAtoi("    -42")
print Solution().myAtoi("4193 with words")
print Solution().myAtoi("with words 4193")
print Solution().myAtoi("-91283472332")
print Solution().myAtoi("21474836460")
