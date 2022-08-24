/**
 https://leetcode.com/problems/excel-sheet-column-title/
 
 Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.
 */
import Foundation

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        // A -> 65
        var messages: [String] = []
        var remain = columnNumber
        while remain > 0 {
            remain -= 1
            let offset = remain % 26
            remain /= 26
            
            let c = String(UnicodeScalar(65 + offset)!)
            messages.insert(c, at: 0)
        }
        return messages.joined()
    }
}

assert(Solution().convertToTitle(1) == "A")
assert(Solution().convertToTitle(28) == "AB")
assert(Solution().convertToTitle(52) == "AZ")
assert(Solution().convertToTitle(701) == "ZY")

print("passed test")
