# coding: utf-8

# Given a string s containing just the characters '(', ')', '{', '}',
# '[' and ']', determine if the input string is valid.
# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.

# Constraints:
# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.

class Solution(object):
    def isValid(self, s):
        stack = []
        mapping = {")": "(", "}": "{", "]": "["}
        for char in s:
            if char in mapping:
                if len(stack) < 1:
                    return False
                if mapping[char] != stack.pop():
                    return False
            else:
                stack.append(char)
        return not stack


print Solution().isValid("([])")
