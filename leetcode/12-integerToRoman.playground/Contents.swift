import Foundation

/**
https://leetcode.com/problems/integer-to-roman
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             100
There are six instances where subtraction is used
I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
*/

class Solution {
    func intToRoman(_ num: Int) -> String {
        if num < 1 || num > 3999 {
            return ""
        }
        let m = ["", "M", "MM", "MMM"]
        let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let l = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        return m[num/1000] + c[num%1000/100] + x[num%1000%100/10] + l[num%10]
    }
    
    func intToRoman1(_ num: Int) -> String {
        if num < 1 || num > 3999 {
            return ""
        }
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var y = num
        var ret = ""
        for (i, v) in values.enumerated() {
            ret += String(repeating: numerals[i], count: (y/v))
            y = y % v
        }
        return ret
    }
}

print(Solution().intToRoman(3))
print(Solution().intToRoman(4))
print(Solution().intToRoman(9))
print(Solution().intToRoman(2994))

print(Solution().intToRoman1(3))
print(Solution().intToRoman1(4))
print(Solution().intToRoman1(9))
print(Solution().intToRoman1(2994))
