# coding: utf-8

# https://leetcode.com/problems/length-of-last-word/

# Given a string s consists of some words separated by spaces, return the
# length of the last word in the string. If the last word does not exist,
# return 0.
# A word is a maximal substring consisting of non-space characters only.

# Constraints:
# 1 <= s.length <= 104
# s consists of only English letters and spaces ' '.


class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        length = 0
        i = len(s) - 1
        while i >= 0 and s[i] == ' ':
            i -= 1
        while i >= 0 and s[i] != ' ':
            i -= 1
            length += 1
        return length


s = "Hello World "
print Solution().lengthOfLastWord(s)
