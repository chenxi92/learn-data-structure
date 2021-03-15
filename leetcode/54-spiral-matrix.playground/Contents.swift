import UIKit

/**
 # https://leetcode.com/problems/spiral-matrix/
 # Given an m x n matrix, return all elements of the matrix in spiral order.

 # Constraints:
 # m == matrix.length
 # n == matrix[i].length
 # 1 <= m, n <= 10
 # -100 <= matrix[i][j] <= 100
 */


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var ans: [Int] = []
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = matrix.count - 1
        while left <= right && top <= bottom {
            // left -> righ
            for i in stride(from: left, through: right, by: 1){
                ans.append(matrix[top][i])
            }
            // top -> bottom
            for i in stride(from: top + 1, through: bottom, by: 1){
                ans.append(matrix[i][right])
            }
            if left < right && top < bottom {
                // right -> left
                for i in stride(from: right - 1, through: left, by: -1) {
                    ans.append(matrix[bottom][i])
                }
                // bottom -> top
                for i in stride(from: bottom - 1, to: top, by: -1) {
                    ans.append(matrix[i][left])
                }
            }
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        return ans
    }
}

let matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
//let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

for array in matrix {
    print(array)
}
print(Solution().spiralOrder(matrix))
