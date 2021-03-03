import Foundation

/**
https://leetcode.com/problems/string-to-integer-atoi/
Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
The algorithm for myAtoi(string s) is as follows:
1. Read in and ignore any leading whitespace.
2. Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
3. Read in next the characters until the next non-digit charcter or the end of the input is reached. The rest of the string is ignored.
4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
6. Return the integer as the final result.

Only the space character ' ' is considered a whitespace character.
Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
*/

class Solution {
    func myAtoi(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var i = 0
        let charArray = Array(s)
        while i < s.count && charArray[i] == " " {
            i += 1
        }
        
        var sign = 1
        if i < s.count && (charArray[i] == "-" || charArray[i] == "+") {
            if charArray[i] == "-" {
                sign = -1
            }
            i += 1
        }
        
        var ret: Int = 0
        while i < s.count && charArray[i].isNumber {
            ret = (ret * 10) + Int(String(charArray[i]))!
            if ret > Int32.max {
                return Int(sign == 1 ? Int32.max : Int32.min)
            }
            i += 1
        }
        return sign == 1 ? ret : -ret
    }
}

print(Solution().myAtoi("42"))
print(Solution().myAtoi("     -42"))
print(Solution().myAtoi("4193 with words"))
print(Solution().myAtoi("with words 4193 "))
print(Solution().myAtoi("-91283472332"))
print(Solution().myAtoi("21474836460"))


