# coding: utf-8

# https://leetcode.com/problems/set-matrix-zeroes/

# Given an m x n matrix. If an element is 0, set its entire row and
# column to 0. Do it in-place.

# Follow up:
# A straight forward solution using O(mn) space is probably a bad idea.
# A simple improvement uses O(m + n) space, but still not the best solution.
# Could you devise a constant space solution?

# Constraints:
# m == matrix.length
# n == matrix[0].length
# 1 <= m, n <= 200
# -231 <= matrix[i][j] <= 231 - 1


class Solution(object):
    def setZeroes(self, matrix):
        rows = set()
        cols = set()
        m = len(matrix)
        n = len(matrix[0])
        for i in range(m):
            for j in range(n):
                if matrix[i][j] == 0:
                    rows.add(i)
                    cols.add(j)
        for i in range(m):
            for j in range(n):
                if i in rows or j in cols:
                    matrix[i][j] = 0


matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
matrix = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
for x in matrix:
    print x
Solution().setZeroes(matrix)
print "---- after set zeroes ---- "
for x in matrix:
    print x
