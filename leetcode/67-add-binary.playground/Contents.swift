import Foundation

/**
 # https://leetcode.com/problems/add-binary/
 # Given two binary strings a and b, return their sum as a binary string.

 # Constraints:
 # 1 <= a.length, b.length <= 104
 # a and b consist only of '0' or '1' characters.
 # Each string does not contain leading zeros except for the zero itself.
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aArray: [Character] = Array(a)
        var bArray: [Character] = Array(b)
        var ans: [String] = []
        var carry = 0
        while !aArray.isEmpty && !bArray.isEmpty {
            let numA = Int(String(aArray.removeLast()))!
            let numB = Int(String(bArray.removeLast()))!
            let num = (numA + numB + carry) % 2
            carry =   (numA + numB + carry) / 2
            ans.append(String(num))
            
        }
        while !aArray.isEmpty {
            let numA = Int(String(aArray.removeLast()))!
            let num = (numA + carry) % 2
            carry =   (numA + carry) / 2
            ans.append(String(num))
        }
        while !bArray.isEmpty {
            let numB = Int(String(bArray.removeLast()))!
            let num = (numB + carry) % 2
            carry =   (numB + carry) / 2
            ans.append(String(num))
        }
        if carry == 1 {
            ans.append("1")
        }
        ans.reverse()
        return ans.joined(separator: "")
    }
}

let a = "1010"
let b = "1011"
print(Solution().addBinary(a, b))
