# https://leetcode.com/problems/sudoku-solver/

# Write a program to solve a Sudoku puzzle by filling the empty cells.

# A sudoku solution must satisfy all of the following rules:
# 1. Each of the digits 1-9 must occur exactly once in each row.
# 2. Each of the digits 1-9 must occur exactly once in each column.
# 3. Each of the digits 1-9 must occur exactly once in each of the
# 9 3x3 sub-boxes of the grid.
#
# The '.' character indicates empty cells.


# Constraints:
# board.length == 9
# board[i].length == 9
# board[i][j] is a digit or '.'.
# It is guaranteed that the input board has only one solution.

class Solution(object):

    def solveSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: None Do not return anything, modify board in-place instead.
        """
        for i in range(9):
            for j in range(9):
                if board[i][j] == ".":
                    self.spaces.append((i, j))
                else:
                    digit = int(board[i][j]) - 1
                    self.rows[i][digit] = True
                    self.cols[j][digit] = True
                    self.block[i / 3][j / 3][digit] = True
        self.dfs(board, 0)

    def dfs(self, board, pos):
        if pos == len(self.spaces):
            self.valid = True
            return
        (i, j) = self.spaces[pos]
        # print i, j
        for digit in range(9):
            if self.rows[i][digit] == self.cols[j][digit] == self.block[i/3][j/3][digit] == False:
                self.rows[i][digit] = self.cols[j][digit] = self.block[i/3][j/3][digit] = True
                board[i][j] = str(digit + 1)
                self.dfs(board, pos + 1)
                self.rows[i][digit] = self.cols[j][digit] = self.block[i/3][j/3][digit] = False
            if self.valid == True:
            	return

    def __init__(self):
        self.valid = False
        self.rows = [[False] * 9 for _ in range(9)]
        self.cols = [[False] * 9 for _ in range(9)]
        self.block = [[[False] * 9 for _ in range(3)] for _ in range(3)]
        self.spaces = []


board = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]]

for x in board:
    print x
print "---- after ----"
Solution().solveSudoku(board)
for x in board:
    print x

