/**
 https://leetcode.com/problems/maximal-rectangle/
 
 Given a rows x cols binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

 */
import Foundation

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        
        let m = matrix.count
        let n = matrix[0].count
        
        var left:  [Int] = Array(repeating: 0, count: n)
        var right: [Int] = Array(repeating: n, count: n)
        var hight: [Int] = Array(repeating: 0, count: n)
        
        var maxArea = 0
        for row in 0..<m {
            var currentLeft = 0
            var currentRight = n
            
            // compute height
            for col in 0..<n {
                if matrix[row][col] == "1" {
                    hight[col] += 1
                } else {
                    hight[col] = 0
                }
            }
            
            // compute left (from left to right)
            for col in 0..<n {
                if matrix[row][col] == "1" {
                    left[col] = max(left[col], currentLeft)
                } else {
                    left[col] = 0
                    currentLeft = col + 1
                }
            }
            
            // compute right (from right to left)
            for col in stride(from: n - 1, through: 0, by: -1) {
                if matrix[row][col] == "1" {
                    right[col] = min(right[col], currentRight)
                } else {
                    right[col] = n
                    currentRight = col
                }
            }
            
            for col in 0..<n {
                maxArea = max(maxArea, (right[col] - left[col]) * hight[col])
            }
        }
        return maxArea
    }
}

let matrix1: [[Character]] = [
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]
]
print(Solution().maximalRectangle(matrix1))

let matrix2: [[Character]] = [["0"]]
print(Solution().maximalRectangle(matrix2))
