/**
 https://leetcode.com/problems/valid-number/
 
 Inspire:
 https://leetcode.com/problems/valid-number/discuss/23738/Clear-Java-solution-with-ifs
 
 We start with trimming.

 - If we see [0-9] we reset the number flags.
 - We can only see . if we didn't see e or ..
 - We can only see e if we didn't see e but we did see a number. We reset numberAfterE flag.
 - We can only see + and - in the beginning and after an e
 - any other character break the validation.
 
 At the and it is only valid if there was at least 1 number and if we did see an e then a number after it as well.
 
 */
import Foundation

class Solution {
    func isNumber(_ s: String) -> Bool {
        let input = s.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var pointSeen = false
        var eSeen = false
        var numberSeen = false
        for (i, c) in input.enumerated() {
            if c.isNumber {
                numberSeen = true
            } else if (String(c) == ".") {
                if eSeen || pointSeen {
                    return false
                }
                pointSeen = true
            } else if (String(c).uppercased() == "E") {
                if eSeen || numberSeen == false {
                    return false
                }
                numberSeen = false
                eSeen = true
            } else if (String(c) == "-" || String(c) == "+") {
                if i != 0 && String(input[i - 1]).uppercased() != "E" {
                    return false
                }
            } else {
                return false
            }
        }
        return numberSeen
    }
}

extension String {
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

print(Solution().isNumber("0"))
print(Solution().isNumber("e"))
print(Solution().isNumber("."))


assert(Solution().isNumber("2"), "should be 2")
assert(Solution().isNumber("0089"), "should be 89")
assert(Solution().isNumber("-0.1"))
assert(Solution().isNumber("+3.14"))
assert(Solution().isNumber("4."))
assert(Solution().isNumber("-.9"))
assert(Solution().isNumber("2e10"))
assert(Solution().isNumber("-90E3"))
assert(Solution().isNumber("3e+7"))
assert(Solution().isNumber("+6e-1"))
assert(Solution().isNumber("53.5e93"))
assert(Solution().isNumber("-123.456e789"))

assert(!Solution().isNumber("abc"))
assert(!Solution().isNumber("1a"))
assert(!Solution().isNumber("1e"))
assert(!Solution().isNumber("e3"))
assert(!Solution().isNumber("99e2.5"))
assert(!Solution().isNumber("--6"))
assert(!Solution().isNumber("-+3"))
assert(!Solution().isNumber("95a54e53"))




