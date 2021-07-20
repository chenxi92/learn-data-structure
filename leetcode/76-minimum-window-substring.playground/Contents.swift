import Foundation


/**
 # https://leetcode.com/problems/minimum-window-substring/

 # Given two strings s and t of lengths m and n respectively,
 # return the minimum window substring of s such that every character
 # in t (including duplicates) is included in the window.
 # If there is no such substring, return the empty string "".

 # The testcases will be generated such that the answer is unique.
 # A substring is a contiguous sequence of characters within the string.

 # Constraints:

 # m == s.length
 # n == t.length
 # 1 <= m, n <= 105
 # s and t consist of uppercase and lowercase English letters.
 */

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if t.count > s.count {
            return ""
        }
        var window = [Character: Int]()
        var need = [Character: Int]()
        for c in t {
            need[c, default: 0] += 1
            window[c] = 0
        }
        
        var left = 0
        var right = 0
        var valid = 0
        var start = 0
        var length = Int.max
        let count = need.count
        let arr = Array(s)
        while right < s.count {
            // 处理右侧字符串
            let c = arr[right]
            right += 1
            if let find = need[c] {
                window[c]! += 1
                if find == window[c] {
                    valid += 1
                }
            }
            
            // 缩短左侧字符串
            while valid == count {
                if right - left < length {
                    start = left
                    length = right - left
                }
                
                let d = arr[left]
                left += 1
                if need[d] != nil {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        if length == Int.max {
            return ""
        }
        let begin = s.index(s.startIndex, offsetBy: start)
        let end = s.index(s.startIndex, offsetBy: start + length)
        return String(s[begin..<end])
    }
    
    func minWindow1(_ s: String, _ t: String) -> String {
        var needMap = [Character: Int]()
        for c in s {
            needMap[c] = 0
        }
        for c in t {
            if needMap[c] != nil {
                needMap[c]! += 1
            } else {
                needMap[c] = 1
            }
        }

        var left = 0
        var right = 0
        var length = Int.max
        var start = 0
        var missing = t.count
        let arr = Array(s)
        while right < s.count {
            let c = arr[right]
            if needMap[c]! > 0 {
                missing -= 1
            }
            needMap[c]! -= 1
            right += 1
            
            while missing == 0 {
                if right - left < length {
                    start = left
                    length = right - left
                }
                
                let d = arr[left]
                if needMap[d]! >= 0 {
                    missing += 1
                }
                needMap[d]! += 1
                left += 1
            }
        }
        
        if length == Int.max {
            return ""
        }
        let begin = s.index(s.startIndex, offsetBy: start)
        let end = s.index(s.startIndex, offsetBy: start + length)
        return String(s[begin..<end])
    }
}

let s = "ebbancf";
let t = "abc"
print (Solution().minWindow1(s, t))
