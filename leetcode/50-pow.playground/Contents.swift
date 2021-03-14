import Foundation

/**
 # https://leetcode.com/problems/powx-n/
 # Implement pow(x, n), which calculates x raised to the power n

 # Contraints:
 # -100.0 < x < 100.0
 # -231 <= n <= 231-1
 # -104 <= xn <= 104
 */

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0.0 {
            return 0.0
        }
        var input = x
        var num = n
        if num < 0 {
            input = 1 / x
            num = -n
        }
        var res = 1.0
        while num > 0 {
            // 判断是否是奇数
            if num & 1 == 1 {
                res *= input
            }
            input *= input
            num >>= 1
        }
        return res
    }
}

print(Solution().myPow(2.0000, 10))
print(Solution().myPow(2.0000, -2))
