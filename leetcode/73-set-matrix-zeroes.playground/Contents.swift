import Foundation

/**
 # https://leetcode.com/problems/set-matrix-zeroes/

 # Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.

 # Follow up:
 # A straight forward solution using O(mn) space is probably a bad idea.
 # A simple improvement uses O(m + n) space, but still not the best solution.
 # Could you devise a constant space solution?

 # Constraints:
 # m == matrix.length
 # n == matrix[0].length
 # 1 <= m, n <= 200
 # -231 <= matrix[i][j] <= 231 - 1
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var rows = Set<Int>()
        var cols = Set<Int>()
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    rows.insert(i)
                    cols.insert(j)
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if rows.contains(i) || cols.contains(j) {
                    matrix[i][j] = 0
                }
            }
        }
    }
}

var matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
for x in matrix {
    print(x)
}
Solution().setZeroes(&matrix)
print("---- after set zeros ----")
for x in matrix {
    print(x)
}
