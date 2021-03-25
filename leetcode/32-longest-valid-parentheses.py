# coding: utf-8

# https://leetcode.com/problems/longest-valid-parentheses/
# Given a string containing just the characters '(' and ')', find the length
# of the longest valid (well-formed) parentheses substring.

# Constraints:
# 0 <= s.length <= 3 * 104
# s[i] is '(', or ')'.


class Solution(object):
    def longestValidParentheses(self, s):
        """
        :type s: str
        :rtype: int
        """
        stack = []
        stack.append(-1)
        maxLength = 0
        for i in range(len(s)):
            if s[i] == "(":
                stack.append(i)
            else:
                stack.pop()
                if len(stack) == 0:
                    stack.append(i)  # record last unmatch index
                else:
                    maxLength = max(maxLength, i - stack[len(stack) - 1])
        return maxLength


s = "(()"
print Solution().longestValidParentheses(s)
