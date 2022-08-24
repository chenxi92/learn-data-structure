/**
 https://leetcode.com/problems/excel-sheet-column-number/
 
 Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.
 */
import Foundation

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var sum = 0
        var i = 1
        for c in columnTitle.reversed() {
            // A ascill value is 65
            let v = (Int(c.asciiValue!) - 64) * i
            sum += v
            i *= 26
        }
        return sum
    }
}

assert(Solution().titleToNumber("A")  == 1,   "excepted 1")
assert(Solution().titleToNumber("AB") == 28,  "excepted 28")
assert(Solution().titleToNumber("AZ") == 52,  "excepted 52")
assert(Solution().titleToNumber("ZY") == 701, "excepted 701")

print("passed test")
