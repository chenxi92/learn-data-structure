import UIKit

/**
 # https://leetcode.com/problems/restore-ip-addresses/

 # Given a string s containing only digits, return all possible valid IP
 # addresses that can be obtained from s. You can return them in any order.

 # Constraints:
 # 0 <= s.length <= 3000
 # s consists of digits only.
 */

class Solution {
    func restoreIpAddress(_ s: String) -> [String] {
        var ans: [String] = []
        if s.count < 4 || s.count > 12 {
            return ans
        }

        for a in 1...3 {
            for b in 1...3 {
                for c in 1...3 {
                    for d in 1...3 {
                        if a + b + c + d != s.count {
                            continue
                        }
                       
                        var start = s.startIndex
                        var offset = a
                        var end = s.index(s.startIndex, offsetBy: offset)
                        let numA = Int(String(s[start..<end]))!
                        
                        start = end
                        offset += b
                        end = s.index(s.startIndex, offsetBy: offset)
                        let numB = Int(String(s[start..<end]))!
                        
                        start = end
                        offset += c
                        end = s.index(s.startIndex, offsetBy: offset)
                        let numC = Int(String(s[start..<end]))!
                        
                        
                        start = end
                        offset += d
                        end = s.index(s.startIndex, offsetBy: offset)
                        let numD = Int(String(s[start..<end]))!
                        
                        if numA <= 255 && numB <= 255 && numC <= 255 && numD <= 255 {
                            let path = String(numA) + "." + String(numB) + "." + String(numC) + "." + String(numD)
                            if path.count == s.count + 3 {
                                ans.append(path)
                            }
                        }
                    }
                }
            }
        }
        return ans
    }
}

print(Solution().restoreIpAddress("25525511135"))
print(Solution().restoreIpAddress("0000"))
print(Solution().restoreIpAddress("1111"))
print(Solution().restoreIpAddress("010010"))
print(Solution().restoreIpAddress("101023"))
