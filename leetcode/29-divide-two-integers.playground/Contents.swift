import Foundation

/**
 # https://leetcode.com/problems/divide-two-integers/

 # Given two integers dividend and divisor, divide two integers
 # without using multiplication, division, and mod operator.
 # Return the quotient after dividing dividend by divisor.

 # The integer division should truncate toward zero,
 # which means losing its fractional part.
 # For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.

 # Note: Assume we are dealing with an environment that could only store
 # integers within the 32-bit signed integer range: [−231, 231 − 1].
 # For this problem, assume that your function returns 231 − 1
 # when the division result overflows.

 # Constraints:
 # -231 <= dividend, divisor <= 231 - 1
 # divisor != 0
 */

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min && divisor == -1 {
            return Int(Int32.max)
        }
        var dvd = abs(dividend)
        let dvs = abs(divisor)
        var sign = -1
        if (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0) {
            sign = 1
        }
        var ans = 0
        while dvd >= dvs {
            var tmp = dvs
            var m = 1
            while tmp<<1 <= dvd {
                tmp <<= 1
                m<<=1
            }
            dvd -= tmp
            ans += m
        }
        return ans * sign
    }
}

print(Solution().divide(15, 3))
