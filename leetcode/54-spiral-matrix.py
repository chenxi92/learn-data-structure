# coding: utf-8

# https://leetcode.com/problems/spiral-matrix/
# Given an m x n matrix, return all elements of the matrix in spiral order.

# Constraints:
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 10
# -100 <= matrix[i][j] <= 100


class Solution(object):
    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """
        left = 0
        top = 0
        right = len(matrix[0]) - 1
        bottom = len(matrix) - 1
        ans = []
        while left <= right and top <= bottom:
            # left -> right
            for j in range(left, right + 1):
                ans.append(matrix[left][j])

            # top -> bottom
            for j in range(top + 1, bottom + 1):
                ans.append(matrix[j][right])

            if left < right and top < bottom:
                # right -> left
                for j in range(right - 1, left, -1):
                    ans.append(matrix[bottom][j])
                # bottom -> top
                for j in range(bottom, top, -1):
                    ans.append(matrix[j][left])
            left += 1
            top += 1
            right -= 1
            bottom -= 1
        return ans


matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
# matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
for array in matrix:
    print array
print Solution().spiralOrder(matrix)
