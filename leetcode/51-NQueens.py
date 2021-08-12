# coding: utf-8

# https://leetcode.com/problems/n-queens/
# The n-queens puzzle is the problem of placing n queens on an n x n chessboard
# such that no two queens attack each other.
# Given an integer n, return all distinct solutions to the n-queens puzzle.
# You may return the answer in any order. Each solution contains a distinct
# board configuration of the n-queens' placement, where 'Q' and '.' both
# indicate a queen and an empty space, respectively.

# Constraints:
# 1 <= n <= 9


class Solution(object):
    def solveNQueens(self, n):
        """
        :type n: int
        :rtype: List[List[str]]
        """
        result = []
        board = [["." for _ in range(n)] for _ in range(n)]
        self.backtrace(result, board, 0)
        return result

    def backtrace(self, result, board, row):
        if row == len(board):
            print "board = ", board
            result.append(map(lambda array: "".join(array), board))
            return
        for col in range(len(board)):
            if self.isValid(board, row, col) is False:
                continue
            board[row][col] = "Q"
            self.backtrace(result, board, row + 1)
            board[row][col] = "."

    def isValid(self, board, row, col):
        for i in range(len(board)):
            if board[i][col] == "Q":
                return False
        i = row - 1
        j = col - 1
        while i >= 0 and j >= 0:
            if board[i][j] == "Q":
                return False
            i -= 1
            j -= 1

        i = row - 1
        j = col + 1
        while i >= 0 and j < len(board):
            if board[i][j] == "Q":
                return False
            i -= 1
            j += 1
        return True


result = Solution().solveNQueens(10)
print result
