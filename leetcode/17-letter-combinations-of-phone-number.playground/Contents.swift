import Foundation

/**
 # https://leetcode.com/problems/letter-combinations-of-a-phone-number/

 # Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
 # Return the answer in any order.
 # A mapping of digit to letters (just like on the telephone buttons) is given below.
 # Note that 1 does not map to any letters.

 # Constraints:
 # 0 <= digits.length <= 4
 # digits[i] is a digit in the range ['2', '9'].
 */

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        let phone: [String: [String]] = [
                    "2" : ["a", "b", "c"],
                    "3" : ["d", "e", "f"],
                    "4" : ["g", "h", "i"],
                    "5" : ["j", "k", "l"],
                    "6" : ["m", "n", "o"],
                    "7" : ["p", "q", "r", "s"],
                    "8" : ["t", "u", "v"],
                    "9" : ["w", "x", "y", "z"]
                    ]
        
        var output: [String] = [""]
        for digit in digits {
            guard let letters = phone[String(digit)] else {
                continue
            }
            var tmp = [String]()
            for str in output {
                for letter in letters {
                    tmp.append("\(str)\(letter)")
                }
            }
            output = tmp
        }
        return output
    }
}

print(Solution().letterCombinations("23"))
