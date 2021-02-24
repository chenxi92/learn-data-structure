import Foundation

/**
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 输入: s = ""
 输出: 0
 
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let charArray = Array(s)
        
        /// 过滤重复字符串
        var occured: Set<Character> = []
    
        /// 滑动窗口右侧位置
        var pointer = 0
        var result = 0
        for index in 0..<charArray.count {
            if index != 0 {
                /// 每次比较需要删除重复字符串
                occured.remove(charArray[index - 1])
            }
            
            /// 遍历找到最长未重复子串
            while pointer < charArray.count && !occured.contains(charArray[pointer]) {
                occured.insert(charArray[pointer])
                pointer += 1
            }
            result = max(result, pointer - index)
        }
        
        return result
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))
print(Solution().lengthOfLongestSubstring("bbbbb"))
print(Solution().lengthOfLongestSubstring("pwwkew"))
print(Solution().lengthOfLongestSubstring(""))

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }
    
    var lenght = 0
    var substring = [Character]()
    for c in s {
        if substring.contains(c), let index = substring.firstIndex(of: c) {
            lenght = max(lenght, substring.count)
            substring.removeSubrange(0...index)
        }
        substring.append(c)
    }
    return max(lenght, substring.count)
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))
print(lengthOfLongestSubstring(""))
