import Foundation

/**
 # https://leetcode.com/problems/sqrtx/
 # Given a non-negative integer x, compute and return the square root of x.
 # Since the return type is an integer, the decimal digits are truncated,
 # and only the integer part of the result is returned.

 # Constraints:
 # 0 <= x <= 231 - 1
 */

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var result = 1
        while left <= right {
            let mid = left + (right - left) / 2
            if mid * mid <= x {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}

print(Solution().mySqrt(8))
print(Solution().mySqrt(9))
