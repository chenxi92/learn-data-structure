import Foundation

/**
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
 */

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows: [[Int: Int]] = Array(repeating: [:], count: 9)
        var columns: [[Int: Int]] = Array(repeating: [:], count: 9)
        var boxes: [[Int: Int]] = Array(repeating: [:], count: 9)

        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    continue
                }
                
                let value: Int = Int(String(board[i][j]))!
                
                if rows[i].keys.contains(value) {
                    return false
                } else {
                    rows[i][value] = 1
                }
                
                if columns[j].keys.contains(value) {
                    return false
                } else {
                    columns[j][value] = 1
                }
                
                let boxIndex = (i / 3) * 3 + (j / 3)
                if boxes[boxIndex].keys.contains(value) {
                    return false
                } else {
                    boxes[boxIndex][value] = 1
                }
            }
        }
        return true
    }
}

//let board: [[Character]] = [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
let board: [[Character]] = [["7",".",".",".","4",".",".",".","."],[".",".",".","8","6","5",".",".","."],[".","1",".","2",".",".",".",".","."],[".",".",".",".",".","9",".",".","."],[".",".",".",".","5",".","5",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".","2",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".",".","."]]
for i in board {
    print(i)
}
print(Solution().isValidSudoku(board))

