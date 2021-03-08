# coding: utf-8

# https://leetcode.com/problems/valid-sudoku/

# Determine if a 9 x 9 Sudoku board is valid.
# Only the filled cells need to be validated according to the following rules:
# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9
# without repetition.

# Note:
# A Sudoku board (partially filled) could be valid but is not necessarily
# solvable.
# Only the filled cells need to be validated according to the mentioned rules.

# Constraints:
# board.length == 9
# board[i].length == 9
# board[i][j] is a digit or '.'.

class Solution(object):
    def isValidSudoku(self, board):
        rows = [{} for i in range(9)]
        columns = [{} for i in range(9)]
        boxes = [{} for i in range(9)]
        print rows

        for i in range(9):
            for j in range(9):
                num = board[i][j]
                if num == ".":
                    continue
                num = int(num)
                boxIndex = (i / 3) * 3 + j / 3

                rows[i][num] = rows[i].get(num, 0) + 1
                columns[j][num] = columns[j].get(num, 0) + 1
                boxes[boxIndex][num] = boxes[boxIndex].get(num, 0) + 1

                if rows[i][num] > 1 or columns[j][num] > 1 or boxes[boxIndex][num] > 1:
                    return False
        return True


print[{} for i in range(9)][1].get(1, 33)
