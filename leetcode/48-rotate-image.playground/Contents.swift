import Foundation

/**
 
 # https://leetcode.com/problems/rotate-image

 # You are given an n x n 2D matrix representing an image, rotate
 # the image by 90 degrees (clockwise). You have to rotate the image
 # in-place, which means you have to modify the input 2D matrix directly.
 #  DO NOT allocate another 2D matrix and do the rotation.

 # matrix[col][n - row - 1] = matrix[row][col]
 
 */

class Solution {
    func rotateImage(_ matrix: inout [[Int]])  {
        let n = matrix.count
        for row in 0..<(n/2) {
            for col in 0..<((n + 1) / 2) {
                let temp = matrix[row][col]
                matrix[row][col] = matrix[n - col - 1][row]
                matrix[n - col - 1][row] = matrix[n - row - 1][n - col - 1]
                matrix[n - row - 1][n - col - 1] = matrix[col][n - row - 1]
                matrix[col][n - row - 1] = temp
            }
        }
    }
}

func log(_ matrix: [[Int]]) {
    for item in matrix {
        var ans = ""
        for i in item {
            ans += String(i)
            ans += "\t"
        }
        print(ans)
    }
}

var matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
log(matrix)
Solution().rotateImage(&matrix)
print("\n----- after rotate -----\n")
log(matrix)
