import Foundation

/**
 # https://leetcode.com/problems/multiply-strings/
 # Given two non-negative integers num1 and num2 represented as strings,
 # return the product of num1 and num2, also represented as a string.
 # Note: You must not use any built-in BigInteger library or
 # convert the inputs to integer directly.

 # Constraints:
 # 1 <= num1.length, num2.length <= 200
 # num1 and num2 consist of digits only.
 # Both num1 and num2 do not contain any leading zero,
 # except the number 0 itself.

 # input : 1 2 3
 #        *4 5 6
 #         7 3 8
 #       6 1 5
 #     4 9 2
 #     5 6 0 8 8
 */

class Solution {
    private func addSring(_ num1: String, _ num2: String) -> String {
        var temp: [String] = []
        var i = num1.count - 1
        var j = num2.count - 1
        var cary = 0
        while i >= 0 || j >= 0 || cary != 0{
            let n1 = 0
            if i >= 0 {
//                n1 = Int
            }
        }
        return ""
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var result = "0"
        return result
    }
}

let num1 = "9"
let num2 = "9"
print(Solution().multiply(num1, num2))
