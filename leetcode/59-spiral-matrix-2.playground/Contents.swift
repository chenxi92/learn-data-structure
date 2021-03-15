import Foundation

/**
 # https://leetcode.com/problems/spiral-matrix-ii/
 # Given a positive integer n, generate an n x n matrix filled with
 # elements from 1 to n2 in spiral order.

 # Constraints:
 # 1 <= n <= 20
 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var ans: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var left = 0
        var right = n - 1
        var top = 0
        var bottom = n - 1
        var num = 1
        while num <= n * n {
            // left -> right
            for i in stride(from: left, through: right, by: 1) {
                ans[top][i] = num
                num += 1
            }
            
            // top -> bottom
            for i in stride(from: top + 1, through: bottom, by: 1) {
                ans[i][right] = num
                num += 1
            }

            if left < right && top < bottom {
                // right -> left
                for i in stride(from: right - 1, through: left, by: -1) {
                    ans[bottom][i] = num
                    num += 1
                }

                // bottom -> top
                for i in stride(from: bottom - 1, to: top, by: -1) {
                    ans[i][left] = num
                    num += 1
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

for item in Solution().generateMatrix(4) {
    print(item)
}
