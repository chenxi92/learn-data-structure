/**
 https://leetcode.com/problems/triangle/
 
 Given a triangle array, return the minimum path sum from top to bottom.

 For each step, you may move to an adjacent number of the row below.
 More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
 */
import Foundation

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.isEmpty {
            return 0
        }
        
        //    minpath[k][i] = min(minpath[k + 1][i], minpath[k + 1][i + 1]) + triangle[k][i]
        // for kth level:
        // => minpath[i] = min(minpath[i], minpath[i + 1]) + triangle[k][i]
        
        var minpath: [Int] = triangle.last!
        let n = minpath.count
        for layer in stride(from: n - 2, through: 0, by: -1) { // each layer, bottom to top
            for i in 0...layer {
                // find minimum child
                let minimumChild = min(minpath[i], minpath[i + 1])
                minpath[i] = minimumChild + triangle[layer][i]
            }
        }
        return minpath.first!
    }
}

let triangle1 = [
    [2],
    [3, 4],
    [6, 5, 7],
    [4, 1, 8, 3]
]
let sum1 = Solution().minimumTotal(triangle1)
assert(sum1 == 11, "excepted 11, but return \(sum1)")

let triangle2 = [
    [-1],
    [2,3],
    [1,-1,-3]
]
let sum2 = Solution().minimumTotal(triangle2)
assert(sum2 == -1, "excepted -1, but return \(sum2)")

print("\n--- passed test")
