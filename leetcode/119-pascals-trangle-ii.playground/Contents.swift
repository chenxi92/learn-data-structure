/**
 https://leetcode.com/problems/pascals-triangle-ii/
 
 Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 */
import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var preArray: [Int] = []
        var curArray: [Int] = []
        for i in 0...rowIndex {
            curArray.removeAll()
            for j in 0..<(i + 1) {
                if j == 0 || j == i {
                    curArray.append(1)
                } else {
                    let a = preArray[j - 1]
                    let b = preArray[j]
                    curArray.append(a + b)
                }
            }
            preArray = curArray
        }
        return curArray
    }
    
    func getRow1(_ rowIndex: Int) -> [Int] {
        var array: [Int] = Array(repeating: 0, count: rowIndex + 1)
        array[0] = 1
        for i in stride(from: 1, to: rowIndex + 1, by: 1) {
            for j in stride(from: i, through: 1, by: -1) {
                array[j] += array[j - 1]
            }
        }
        return array
    }
}


print(Solution().getRow(0))
print(Solution().getRow1(0))
print("")

print(Solution().getRow(1))
print(Solution().getRow1(1))
print("")

print(Solution().getRow(2))
print(Solution().getRow1(2))
print("")

print(Solution().getRow(3))
print(Solution().getRow1(3))

print("--- passed test")
