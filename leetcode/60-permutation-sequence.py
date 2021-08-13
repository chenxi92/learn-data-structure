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

    def getPermutation1(self, n, k):
        """
        :type n: int
        :type k: int
        :rtype: str
        """
        result = []
        path = []
        collections = list(range(1, n + 1))
        used = {}
        for i in collections:
            used[i] = False

        def backtrace(path, collections):
            if n == len(path):
                result.append(path[:])
                return
            for i in collections:
                if used[i] is True:
                    continue
                path.append(str(i))
                used[i] = True
                backtrace(path, collections)
                path.pop(len(path) - 1)
                used[i] = False

        backtrace(path, collections)
        return "".join(result[k - 1])


print Solution().getPermutation(8, 14)
print Solution().getPermutation1(8, 14)

