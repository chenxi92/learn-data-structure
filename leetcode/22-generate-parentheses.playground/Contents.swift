import Foundation

/**
 # https://leetcode.com/problems/generate-parentheses/
 # Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 # Input: n = 3
 # Output: ["((()))","(()())","(())()","()(())","()()()"]

 # Constraints:
 # 1 <= n <= 8
 */

class Solution {
    
    private func backtract(_ s: String, _ left: Int, _ right: Int, _ n: Int, _ output: inout [String]) {
        if s.count == 2 * n {
            output.append(s)
            return
        }
        if left < n {
            backtract(s + "(", left + 1, right, n, &output)
        }
        if right < left {
            backtract(s + ")", left, right + 1, n, &output)
        }
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var ans: [String] = []
        backtract("", 0, 0, n, &ans)
        return ans
    }
}

print(Solution().generateParenthesis(2))
