# coding: utf-8

# https://leetcode.com/problems/plus-one/

# Given a non-empty array of decimal digits representing a non-negative
# integer, increment one to the integer.
# The digits are stored such that the most significant digit is at the head
# of the list, and each element in the array contains a single digit.
# You may assume the integer does not contain any leading zero,
# except the number 0 itself.

# Constraints:
# 1 <= digits.length <= 100
# 0 <= digits[i] <= 9

class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        ans = []
        i = len(digits) - 1

        num = (digits[i] + 1) % 10
        carry = (digits[i] + 1) / 10
        ans.append(num)

        i -= 1
        while i >= 0:
            num = (digits[i] + carry) % 10
            carry = (digits[i] + carry) / 10
            ans.append(num)
            i -= 1

        if carry == 1:
            ans.append(1)
        ans.reverse()
        return ans


print Solution().plusOne([9])
