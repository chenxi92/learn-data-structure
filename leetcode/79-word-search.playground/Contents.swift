import Foundation

/**
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
 */

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var copyBoary: [[Character]] = Array(board)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if self.dfs(&copyBoary, i, j, Array(word)) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ word: [Character]) -> Bool {
        if word.count == 0 {
            return true
        }
        if i < 0 || i >= board.count {
            return false
        }
        if j < 0 || j >= board[0].count {
            return false
        }
        if board[i][j] != word[0] {
            return false
        }
        /// avoid visit same character again
        let temp = board[i][j]
        board[i][j] = "#"
        var remainWord = Array(word)
        remainWord.removeFirst()
        let res = dfs(&board, i + 1, j, remainWord) || dfs(&board, i - 1, j, remainWord) || dfs(&board, i, j + 1, remainWord) || dfs(&board, i, j - 1, remainWord)
        board[i][j] = temp
        return res
    }
    
    func exist1(_ board: [[Character]], _ word: String) -> Bool {
        var copyBoary: [[Character]] = Array(board)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if self.dfs1(&copyBoary, i, j, Array(word)) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfs1(_ board: inout [[Character]], _ i: Int, _ j: Int, _ word: [Character], _ index: Int = 0) -> Bool {
        if word.count == index {
            return true
        }
        if i < 0 || i >= board.count {
            return false
        }
        if j < 0 || j >= board[0].count {
            return false
        }
        if board[i][j] != word[index] {
            return false
        }
        /// avoid visit same character again
        let temp = board[i][j]
        board[i][j] = "#"
        let res = self.dfs1(&board, i + 1, j, word, index + 1) || self.dfs1(&board, i - 1, j, word, index + 1) || self.dfs1(&board, i, j + 1, word, index + 1) || self.dfs1(&board, i, j - 1, word, index + 1)
        board[i][j] = temp
        return res
    }
}

let board: [[Character]] = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
for grid in board {
    print(grid)
}
let word = "ABCB"
let res = Solution().exist1(board, word)
print("\(word) exist: \(res)")

let word1 = "CCE"
let res1 = Solution().exist1(board, word1)
print("\(word1) exist: \(res1)")
