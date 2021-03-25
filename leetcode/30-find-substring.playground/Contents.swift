import UIKit

/**
 # https://leetcode.com/problems/substring-with-concatenation-of-all-words

 # You are given a string s and an array of strings words of the same length.
 # Return all starting indices of substring(s) in s that is a concatenation of
 # each word in words exactly once, in any order,
 # and without any intervening characters.
 # You can return the answer in any order.

 # Constraints:
 # 1 <= s.length <= 104
 # s consists of lower-case English letters.
 # 1 <= words.length <= 5000
 # 1 <= words[i].length <= 30
 # words[i] consists of lower-case English letters.
 */

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var map = [String: Int]()
        for w in words {
            if map[w] != nil {
                map[w]! += 1
            } else {
                map[w] = 1
            }
        }
        var ans: [Int] = []
        let inputArray: [Character] = Array(s)
        let wordLength = words[0].count
        let wordCount = words.count
        let n = inputArray.count - wordCount * wordLength + 1
        for i in 0..<n {
            var seqMap = [String: Int]()
            let seqArray = Array(inputArray[i..<(i + wordCount * wordLength)])
            for j in stride(from: 0, to: seqArray.count, by: wordLength) {
                let w = String(seqArray[j..<(j + wordLength)])
                if seqMap[w] != nil {
                    seqMap[w]! += 1
                } else {
                    seqMap[w] = 1
                }
            }
            if seqMap == map {
                ans.append(i)
            }
        }
        return ans
    }
    
    
}

let s = "barfoothefoobarman"
let words: [String] = ["foo", "bar"]
print(Solution().findSubstring(s, words))
