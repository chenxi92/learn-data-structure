# coding: utf-8


class Solution(object):
    def getPermutation(self, n, k):
        """
        :type n: int
        :type k: int
        :rtype: str
        """
        numbers = []
        factorials = []
        factorials.append(1)
        sum = 1
        for i in range(1, n + 1):
            sum *= i
            factorials.append(sum)
            numbers.append(i)

        ans = ""
        k -= 1
        for i in range(1, n + 1):
            index = k / factorials[n - i]
            ans += str(numbers[index])
            numbers.pop(index)
            k -= index * factorials[n - i]
        return ans


print Solution().getPermutation(4, 14)
