import Foundation

/**
 # https://leetcode.com/problems/roman-to-integer/
 # Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 # Symbol       Value
 # I             1
 # V             5
 # X             10
 # L             50
 # C             100
 # D             500
 # M             1000

 # There are six instances where subtraction is used:
 # I can be placed before V (5) and X (10) to make 4 and 9.
 # X can be placed before L (50) and C (100) to make 40 and 90.
 # C can be placed before D (500) and M (1000) to make 400 and 900.

 # Constraints:
 # 1 <= s.length <= 15
 # s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
 # It is guaranteed that s is a valid roman numeral in the range [1, 3999].
 */

class Solution {
    func romanToInt(_ s: String) -> Int {
        let map: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

        let charArray = Array(s)
        var sum = 0
        var preCharValue = 0
        for char in charArray {
            let charValue = map[char] ?? 0
            if charValue > preCharValue {
                sum -= preCharValue
            } else {
                sum += preCharValue
            }
            preCharValue = charValue
        }
        sum += preCharValue
        return sum
    }
}

print(Solution().romanToInt("III"))
print(Solution().romanToInt("IV"))
print(Solution().romanToInt("IX"))
print(Solution().romanToInt("LVIII"))
print(Solution().romanToInt("MCMXCIV"))
