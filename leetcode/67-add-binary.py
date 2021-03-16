# coding: utf-8

# https://leetcode.com/problems/add-binary/
# Given two binary strings a and b, return their sum as a binary string.

# Constraints:
# 1 <= a.length, b.length <= 104
# a and b consist only of '0' or '1' characters.
# Each string does not contain leading zeros except for the zero itself.

class Solution(object):
    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        ans = []
        l1 = len(a) - 1
        l2 = len(b) - 1
        carry = 0
        while l1 >= 0 and l2 >= 0:
            num = (int(a[l1]) + int(b[l2]) + carry) % 2
            ans.append(str(num))
            carry = (int(a[l1]) + int(b[l2]) + carry) / 2
            l1 -= 1
            l2 -= 1
        while l1 >= 0:
            num = (int(a[l1]) + carry) % 2
            ans.append(str(num))
            carry = (int(a[l1]) + carry) / 2
            l1 -= 1
        while l2 >= 0:
            num = (int(b[l2]) + carry) % 2
            ans.append(str(num))
            carry = (int(b[l2]) + carry) / 2
            l2 -= 1
        if carry == 1:
            ans.append("1")
        ans.reverse()
        return "".join(ans)


print Solution().addBinary("1010", "1011")
