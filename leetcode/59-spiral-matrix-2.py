# coding: utf-8

# https://leetcode.com/problems/spiral-matrix-ii/
# Given a positive integer n, generate an n x n matrix filled with
# elements from 1 to n2 in spiral order.

# Constraints:
# 1 <= n <= 20


class Solution(object):
    def generateMatrix(self, n):
        ans = []
        for row in range(n):
            ans.append([])
            for col in range(n):
                ans[row].append(0)
        top = 0
        bottom = n - 1
        left = 0
        right = n - 1
        num = 1
        while num <= n * n and left <= right and top <= bottom:
            # left -> right
            for i in range(left, right + 1):
                ans[top][i] = num
                num += 1
            # top -> bottom
            for i in range(top + 1, bottom + 1):
                ans[i][right] = num
                num += 1
            if top < bottom and left < right:
                # right -> left
                for i in range(right - 1, left - 1, -1):
                    ans[bottom][i] = num
                    num += 1
                # bottom -> top
                for i in range(bottom - 1, top, -1):
                    ans[i][left] = num
                    num += 1
            top += 1
            bottom -= 1
            left += 1
            right -= 1
        return ans


matrix = Solution().generateMatrix(4)
for item in matrix:
    print item
