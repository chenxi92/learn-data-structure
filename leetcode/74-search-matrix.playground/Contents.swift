import Foundation

/**
 
 # https://leetcode.com/problems/search-a-2d-matrix/

 # Write an efficient algorithm that searches for a value in an m x n matrix.
 # This matrix has the following properties:
 # Integers in each row are sorted from left to right.
 # The first integer of each row is greater than the last integer of
 # the previous row.

 # Constraints:
 # m == matrix.length
 # n == matrix[i].length
 # 1 <= m, n <= 100
 # -104 <= matrix[i][j], target <= 104
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = m * n - 1
        while left <= right {
            let mid = (left + right) / 2
            let value = matrix[mid / n][mid % n]
            if value == target {
                return true
            } else if value > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
}

let matrix = [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]]
let target = 3
print(Solution().searchMatrix(matrix, target))
