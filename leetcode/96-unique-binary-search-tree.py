
# https://leetcode.com/problems/unique-binary-search-trees

# Given an integer n, return the number of structurally unique BST's (binary
# search trees) which has exactly n nodes of unique values from 1 to n.

# Constraints:
# 1 <= n <= 19

class Solution(object):
    def numTrees(self, n):
        """
        F(i, N) = G(i-1) * G(N-i)
        """
        dp = [0] * (n + 1)
        dp[0] = 1
        dp[1] = 1
        for level in range(2, n + 1):
            for root in range(1, level + 1):
                dp[level] += dp[root - 1] * dp[level - root]
        return dp[n]

    def numTrees1(self, n):
        return self.trees(1, n)

    def trees(self, low, high):
        if low >= high:
            return 1
        total = 0
        for i in range(low, high + 1):
            total += self.trees(low, i - 1) * self.trees(i + 1, high)
        return total


n = 17
print "--- 0 ---"
print Solution().numTrees(n)
print "--- 1 ---"
print Solution().numTrees1(n)
print "--- done ---"
