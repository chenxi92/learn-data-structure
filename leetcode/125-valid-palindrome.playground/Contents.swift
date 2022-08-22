/**
 https://leetcode.com/problems/valid-palindrome/
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.


 */
import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        
        var stack: [Character] = []
        s.forEach { c in
            if c.isASCII {
                if c.asciiValue! >= 48 && c.asciiValue! <= 57 {
                    stack.append(c)
                }
                if c.asciiValue! >= 65 && c.asciiValue! <= 90 {
                    let lower = String(c).lowercased()
                    stack.append(Character(lower))
                }
                if c.asciiValue! >= 97 && c.asciiValue! <= 122 {
                    stack.append(c)
                }
            }   
        }
                
        while stack.count >= 2  {
            let first = stack.removeFirst()
            let last = stack.removeLast()
            
            if first != last {
                return false
            }
            if stack.count == 1 {
                return true
            }
        }
        return true
    }
}

//let s1 = "A man, a plan, a canal: Panama"
//assert(Solution().isPalindrome(s1))
//
//let s2 = "race a car"
//assert(Solution().isPalindrome(s2) == false)
//
//let s3 = " "
//assert(Solution().isPalindrome(s3))

let s4 = "ab_a"
print(Solution().isPalindrome(s4))

print("--- passed test")
