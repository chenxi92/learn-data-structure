# coding: utf-8

# https://leetcode.com/problems/palindrome-number/
# Given an integer x, return true if x is palindrome integer.
# An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

class Solution(object):
    def isPalindrome(self, x):
        if x < 0:
            return False
        elif x == 0:
            return True
        if x % 10 == 0:
            return False
        y = x
        reverse = 0
        while y > 0:
            reverse = (reverse * 10) + (y % 10)
            y = (y / 10)
        return reverse == x

print Solution().isPalindrome(121)
print Solution().isPalindrome(-121)
print Solution().isPalindrome(10)
print Solution().isPalindrome(123)