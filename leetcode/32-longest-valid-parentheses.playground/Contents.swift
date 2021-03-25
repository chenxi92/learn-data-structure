import UIKit

/**
 # https://leetcode.com/problems/longest-valid-parentheses/
 # Given a string containing just the characters '(' and ')', find the length
 # of the longest valid (well-formed) parentheses substring.

 # Constraints:
 # 0 <= s.length <= 3 * 104
 # s[i] is '(', or ')'.
*/

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var stack: [Int] = []
        stack.append(-1)
        let sArray = Array(s)
        var maxLength = 0
        for i in 0..<s.count {
            if sArray[i] == "(" {
                stack.append(i)
            } else {
                stack.removeLast()
                if stack.isEmpty {
                    /// record last unmatched index
                    stack.append(i)
                } else {
                    maxLength = max(maxLength, i - stack[stack.count - 1])
                }
            }
        }
        return maxLength
    }
}

let s = ")()())"
//let s = "(()"
print(Solution().longestValidParentheses(s))
