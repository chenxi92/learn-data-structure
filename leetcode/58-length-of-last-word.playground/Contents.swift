import Foundation

/**
 # https://leetcode.com/problems/length-of-last-word/

 # Given a string s consists of some words separated by spaces, return the
 # length of the last word in the string. If the last word does not exist,
 # return 0.
 # A word is a maximal substring consisting of non-space characters only.

 # Constraints:
 # 1 <= s.length <= 104
 # s consists of only English letters and spaces ' '.

 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        let array: [Character] = Array(s)
        var i = array.count - 1
        while i >= 0 && array[i] == " " {
            i -= 1
        }
        while i >= 0 && array[i] != " " {
            i -= 1
            length += 1
        }
        return length
    }
}

let s = "Hello World "
print(Solution().lengthOfLastWord(s))
