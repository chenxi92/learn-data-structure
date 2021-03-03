import UIKit

/**
 # https://leetcode.com/problems/palindrome-number/
 # Given an integer x, return true if x is palindrome integer.
 # An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        if x == 0 {
            return true
        }
        if x % 10 == 0 {
            return false
        }
        var y = x
        var reverse = 0
        while y > 0 {
            reverse = (reverse * 10) + (y % 10)
            y = (y / 10)
        }
        return reverse == x
    }
}

print(Solution().isPalindrome(121))
print(Solution().isPalindrome(-121))
print(Solution().isPalindrome(10))
print(Solution().isPalindrome(123))
