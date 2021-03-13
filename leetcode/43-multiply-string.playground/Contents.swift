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
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var result: [Int] = Array(repeating: 0, count: num1.count + num2.count)
        let num1Array: [Character] = Array(num1)
        let num2Array: [Character] = Array(num2)
        var i = num1Array.count - 1
        while i >= 0 {
            let n1: Int = Int(String(num1Array[i]))!
            var j = num2Array.count - 1
            while j >= 0 {
                let n2: Int = Int(String(num2Array[j]))!
                let sum: Int = result[i + j + 1] + n1 * n2
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
                j -= 1
            }
            i -= 1
        }
        var ans = ""
        for i in 0..<result.count {
            if i == 0 && result[i] == 0 {
                continue
            }
            ans += String(result[i])
        }
        return ans
    }
}

let num1 = "123"
let num2 = "456"
print(Solution().multiply(num1, num2))
