import Foundation

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var result = 0
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        backtrace(&result, &board, 0)
        return result
    }
    
    private func backtrace(_ result: inout Int, _ board: inout [[String]], _ row: Int) {
        if row == board.count {
            result += 1
            return
        }
        
        for col in 0..<board.count {
            if isValid(board, row, col) {
                board[row][col] = "Q"
                backtrace(&result, &board, row + 1)
                board[row][col] = "."
            }
        }
    }
    
    private func isValid(_ board: [[String]], _ row: Int, _ col:Int) -> Bool {
        for i in stride(from: 0, to: board.count, by: 1) {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        i = row - 1
        j = col + 1
        while i >= 0 && j < board.count {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        return true
    }
    
}

let n = Solution().totalNQueens(4)
print(n)
