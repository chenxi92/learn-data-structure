import Foundation

/**
 # https://leetcode.com/problems/group-anagrams/
 # Given an array of strings strs, group the anagrams together.
 # You can return the answer in any order. An Anagram is a word
 # or phrase formed by rearranging the letters of a different
 # word or phrase, typically using all the original letters exactly once.
 */

class Solultion {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var mapping: [String: [String]] = [:]
        for text in strs {
            let key =  String(text.sorted())
            if mapping[key] == nil {
                mapping[key] = [text]
            } else {
                mapping[key]?.append(text)
            }
        }
        var ans: [[String]] = []
        for value in mapping.values {
            ans.append(value)
        }
        return ans
    }
}

let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
print(Solultion().groupAnagrams(strs))
