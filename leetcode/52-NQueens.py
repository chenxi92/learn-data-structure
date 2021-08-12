# coding: utf-8

class Solution(object):
    result = 0

    def totalNQueens(self, n):
        """
        :type n: int
        :rtype: int
        """
        board = [["." for _ in range(n)] for _ in range(n)]
        self.backtrace(board, 0)
        return self.result

    def backtrace(self, board, row):
        if row == len(board):
            self.result += 1
            return
        for col in range(len(board)):
            if self.isValid(board, row, col) is False:
                continue
            board[row][col] = "Q"
            self.backtrace(board, row + 1)
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


print Solution().totalNQueens(4)
