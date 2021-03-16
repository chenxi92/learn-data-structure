import Foundation

/**
 # https://leetcode.com/problems/plus-one/

 # Given a non-empty array of decimal digits representing a non-negative
 # integer, increment one to the integer.
 # The digits are stored such that the most significant digit is at the head
 # of the list, and each element in the array contains a single digit.
 # You may assume the integer does not contain any leading zero,
 # except the number 0 itself.

 # Constraints:
 # 1 <= digits.length <= 100
 # 0 <= digits[i] <= 9
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var ans: [Int] = []
        var i = digits.count - 1
        var num = (digits[i] + 1) % 10
        ans.append(num)
        var carry = (digits[i] + 1) / 10
        i -= 1
        while i >= 0 {
            num = (digits[i] + carry) % 10
            ans.append(num)
            carry = (digits[i] + carry) / 10
            i -= 1
        }
        if carry == 1 {
            ans.append(1)
        }
        ans.reverse()
        return ans
    }
}

print(Solution().plusOne([9]))

print(Solution().plusOne([1, 2, 3]))
