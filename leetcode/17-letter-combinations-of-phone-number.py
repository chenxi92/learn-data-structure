# coding: utf-8

# https://leetcode.com/problems/letter-combinations-of-a-phone-number/

# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. 
# Return the answer in any order.
# A mapping of digit to letters (just like on the telephone buttons) is given below.
# Note that 1 does not map to any letters.

# Constraints:
# 0 <= digits.length <= 4
# digits[i] is a digit in the range ['2', '9'].

class Solution(object):
    def letterCombinations(self, digits):
        phone = { '2': ['a', 'b', 'c'],
                  '3': ['d', 'e', 'f'],
                  '4': ['g', 'h', 'i'],
                  '5': ['j', 'k', 'l'],
                  '6': ['m', 'n', 'o'],
                  '7': ['p', 'q', 'r', 's'],
                  '8': ['t', 'u', 'v'],
                  '9': ['w', 'x', 'y', 'z']
                }
        def backtrack(combination, next_digists):
            if len(next_digists) == 0:
                output.append(combination)
            else:
                for letter in phone[next_digists[0]]:
                    backtrack(combination + letter, next_digists[1:])
        output = []
        if digits:
            backtrack("", digits)
        return output
    
    def letterCombinations1(self, digits):
        if len(digits) < 1:
            return []
        phone = { '2': ['a', 'b', 'c'],
                  '3': ['d', 'e', 'f'],
                  '4': ['g', 'h', 'i'],
                  '5': ['j', 'k', 'l'],
                  '6': ['m', 'n', 'o'],
                  '7': ['p', 'q', 'r', 's'],
                  '8': ['t', 'u', 'v'],
                  '9': ['w', 'x', 'y', 'z']
                }
        output = ['']
        for digit in digits:
            if not phone.has_key(digit):
                continue
            tmp = []
            for ret in output:
                for letter in phone[digit]:
                    tmp.append(ret + letter)
            output = tmp
        return output
print Solution().letterCombinations("23")
print Solution().letterCombinations1("23")