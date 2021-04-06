import UIKit

/**
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
 */

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        self.solve(&board)
    }
    
    private func solve(_ board: inout [[Character]]) -> Bool {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "." {
                    for c in 1...9 {
                        let char = Character(String(c))
                        if self.isValid(board, i, j, char) == true {
                            board[i][j] = char
                            
                            if self.solve(&board) == true {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    private func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ c: Character) -> Bool {
        for i in 0..<9 {
            /// check row
            if board[i][col] != "." && board[i][col] == c {
                return false
            }
            /// check col
            if board[row][i] != "." && board[row][i] == c {
                return false
            }
            /// check 3 * c box
            let x = 3 * (row / 3) + i / 3
            let y = 3 * (col / 3) + i % 3
            if board[x][y] != "." && board[x][y] == c {
                return false
            }
        }
        return true
    }
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
for e in board {
    print(e)
}
print("\n--- after ---\n")
Solution().solveSudoku(&board)
for e in board {
    print(e)
}
