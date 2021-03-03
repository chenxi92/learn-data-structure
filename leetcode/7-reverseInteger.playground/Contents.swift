import Foundation

/// https://leetcode.com/problems/reverse-integer/
/// Given a signed 32-bit integer x, return x with its digits reversed.
/// If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

class Solution {
    func reverse(_ x: Int) -> Int {
        var t = 0
        var y = abs(x)
        while y > 0 {
            t = (t * 10) + (y % 10)
            if t > INT32_MAX || t < -INT32_MAX{
                return 0
            }
            y = (y / 10)
        }
        if x < 0 {
            t *= -1
        }
        return t
    }
}

print(Solution().reverse(123))
