/**
 https://leetcode.com/problems/pascals-triangle/
 
 **/
import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var pascalsArray: [[Int]] = []
        for row in 0..<numRows {
            if row == 0 {
                pascalsArray.append([1])
                continue
            }
            if row == 1 {
                pascalsArray.append([1, 1])
                continue
            }
            
            let preArray = pascalsArray[row - 1]
            var currentArray: [Int] = []
            let count = row + 1
            for col in 0..<count {
                var value = 1
                if col > 0 && col < count - 1 {
                    value = preArray[col - 1] + preArray[col]
                }
                currentArray.append(value)
            }
            pascalsArray.append(currentArray)
        }
        return pascalsArray
    }
    
    func generate1(_ numRows: Int) -> [[Int]] {
        var pascalsArray: [[Int]] = []
        for i in 0..<numRows {
            var array: [Int] = []
            
            for j in 0..<(i + 1) {
                if j == 0 || j == i {
                    array.append(1)
                } else {
                    let a = pascalsArray[i - 1][j - 1]
                    let b = pascalsArray[i - 1][j]
                    array.append(a + b)
                }
            }
            pascalsArray.append(array)
        }
        return pascalsArray
    }
}

Solution().generate(10).forEach { print($0) }
print("\n------\n")
Solution().generate1(10).forEach { print($0) }

print("\n--- passed test")
