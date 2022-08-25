/**
 https://leetcode.com/problems/surrounded-regions/
 
 Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 */
import Foundation

class Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty else { return }
        
        let row = board.count
        let col = board.first!.count
        
        /// 1.1 check border (rows)
        for i in stride(from: 0, to: row, by: 1) {
            check(&board, i, 0, row, col)
            if col > 1 {
                check(&board, i, col - 1, row, col)
            }
        }
        
        /// 1.2 check border (columns)
        for j in stride(from: 1, to: col, by: 1) {
            check(&board, 0, j, row, col)
            if row > 1 {
                check(&board, row - 1, j, row, col)
            }
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "O" { /// First change 'O' to 'X'
                    board[i][j] = "X"
                } else if board[i][j] == "1" { /// Second change '1' to 'O'
                    board[i][j] = "O"
                }
            }
        }
    }
    
    /// Check four border, change 'O' to '1'
    /// - Parameters:
    ///   - board: The border characters
    ///   - i: current row
    ///   - j: current col
    ///   - row: total row
    ///   - col: total col
    private func check(_ board: inout [[Character]], _ i: Int, _ j: Int, _ row: Int, _ col: Int) {
        if board[i][j] != "O" {
            return
        }
        board[i][j] = "1"
        if i > 1 { // check up direction
            check(&board, i - 1, j, row, col)
        }
        if j > 1 { // check left direction
            check(&board, i, j - 1, row, col)
        }
        if i + 1 < row { // check bottom direction
            check(&board, i + 1, j, row, col)
        }
        if j + 1 < col { // check right direction
            check(&board, i, j + 1, row, col)
        }
    }
}

var board: [[Character]] = [
    ["X", "X", "X", "X"],
    ["X", "O", "O", "X"],
    ["X", "X", "O", "X"],
    ["X", "O", "X", "X"]
]

board.forEach { print($0) }

Solution().solve(&board)

print("\n--- after ---")
board.forEach { print($0) }
