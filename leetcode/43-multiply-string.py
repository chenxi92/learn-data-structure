# coding: utf-8

# https://leetcode.com/problems/multiply-strings/
# Given two non-negative integers num1 and num2 represented as strings,
# return the product of num1 and num2, also represented as a string.
# Note: You must not use any built-in BigInteger library or
# convert the inputs to integer directly.

# Constraints:
# 1 <= num1.length, num2.length <= 200
# num1 and num2 consist of digits only.
# Both num1 and num2 do not contain any leading zero,
# except the number 0 itself.

# input : 1 2 3
#        *4 5 6
#         7 3 8
#       6 1 5
#     4 9 2
#     5 6 0 8 8


class Solution(object):

    def multiply(self, num1, num2):
        if num1 == "0" or num2 == "0":
            return "0"
        results = "0"
        for i in range(len(num2) - 1, -1, -1):
            carry = 0
            n2 = int(num2[i])
            # print "i = ", i, n2
            temp = []
            # 补0
            count = 0
            while count < len(num2) - 1 - i:
                temp.append(str(0))
                count += 1
            for j in range(len(num1) - 1, -1, -1):
                n1 = int(num1[j])
                # print "j = ", j, n1
                product = (n1 * n2 + carry) % 10
                # print product
                temp.append(str(product))
                carry = (n1 * n2 + carry) / 10
            if carry != 0:
                temp.append(str(carry))
            temp.reverse()
            results = self.addString(results, "".join(temp))
        return results

    def addString(self, num1, num2):
        carry = 0
        i = len(num1) - 1
        j = len(num2) - 1
        temp = []
        while i >= 0 or j >= 0 or carry != 0:
            n1 = 0
            if i >= 0:
                n1 = int(num1[i])
            n2 = 0
            if j >= 0:
                n2 = int(num2[j])
            sum = (n1 + n2 + carry) % 10
            temp.append(str(sum))
            carry = (n1 + n2 + carry) / 10
            i -= 1
            j -= 1
        temp.reverse()
        return "".join(temp)


num1 = "123"
num2 = "456"
# num1 = "9"
# num2 = "9"
print Solution().multiply(num1, num2)
