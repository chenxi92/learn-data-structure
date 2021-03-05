import Foundation

/**
 # Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 # An input string is valid if:

 # Open brackets must be closed by the same type of brackets.
 # Open brackets must be closed in the correct order.

 # Constraints:
 # 1 <= s.length <= 104
 # s consists of parentheses only '()[]{}'.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let mapping: [Character: Character] = [")": "(", "}": "{", "]": "["]
        for char in s {
            if mapping[char] != nil {
                if stack.count < 1 || mapping[char] != stack.popLast() {
                    return false
                }
            } else {
                stack.append(char)
            }
        }
        return stack.count == 0
    }
}

print(Solution().isValid("([]])"))
