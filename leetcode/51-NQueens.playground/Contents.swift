import Foundation

/**
 
 https://leetcode.com/problems/n-queens/
 
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.
 
 Constraints:

 1 <= n <= 9
 */
class Solution {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[String]] = []
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        backtrace(&result, &board, 0)
        return result
    }
    
    private func backtrace(_ result: inout [[String]], _ board: inout [[String]], _ row: Int) {
        
        if row == board.count {
            result.append(board.map { $0.joined() })
            return
        }
        
        for col in 0..<board.count {
            if isValid(board, row, col) == false {
                continue
            }
            board[row][col] = "Q"
            backtrace(&result, &board, row + 1)
            board[row][col] = "."
        }
    }
    
    private func isValid(_ board: [[String]], _ row: Int, _ col: Int) -> Bool {
        /// check current column
        for i in stride(from: 0, to: board.count, by: 1) {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        /// check righ upper
        var i = row - 1;
        var j = col + 1
        while i >= 0 && j < board.count {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        /// check left upper
        i = row - 1
        j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        return true
    }
}

print(Solution().solveNQueens(4))
