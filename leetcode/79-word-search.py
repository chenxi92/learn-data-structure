# coding: utf-8

# https://leetcode.com/problems/word-search/
# Given an m x n grid of characters board and a string word, return true
# if word exists in the grid. The word can be constructed from letters of
# sequentially adjacent cells, where adjacent cells are horizontally or
# vertically neighboring. The same letter cell may not be used more than once.
# Note: There will be some test cases with a board or a word larger than
# constraints to test if your solution is using pruning.

# Constraints:
# m == board.length
# n = board[i].length
# 1 <= m, n <= 6
# 1 <= word.length <= 15
# board and word consists of only lowercase and uppercase English letters.


class Solution(object):

    def exist(self, board, word):
        for i in range(len(board)):
            for j in range(len(board[0])):
                if self.dfs(board, i, j, word):
                    return True
        return False

    def dfs(self, board, i, j, word):
        if len(word) == 0:
            return True
        if i < 0 or i >= len(board):
            return False
        if j < 0 or j >= len(board[0]):
            return False
        if word[0] != board[i][j]:
            return False
        temp = board[i][j]
        board[i][j] = "#"
        res = self.dfs(board, i + 1, j, word[1:]) or self.dfs(board, i - 1, j, word[1:]) or self.dfs(
            board, i, j + 1, word[1:]) or self.dfs(board, i, j - 1, word[1:])
        board[i][j] = temp
        return res


board = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
for grid in board:
    print grid
word = "ABCB"
res = Solution().exist(board, word)
print "{} exist: {}".format(word, res)

# word = "SEE"
# res = Solution().exist(board, word)
# print "{} exist: {}".format(word, res)
