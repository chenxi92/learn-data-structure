/**
 https://leetcode.com/problems/text-justification/
 */
import Foundation

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var results: [String] = []
        
        var left = 0
        while left < words.count {
            let right = findRight(left: left, words: words, maxWidth: maxWidth)
            let line = justify(left: left, right: right, words: words, maxWidth: maxWidth)
            results.append(line)
            left = right + 1
        }
        return results
    }
    
    private func findRight(left: Int, words: [String], maxWidth: Int) -> Int {
        var right = left
        var sum = words[right].count
        right += 1
        
        /// +1 means different words joined with space " "
        while right < words.count && (sum + 1 + words[right].count) <= maxWidth {
            sum += 1 + words[right].count
            right += 1
        }
        return right - 1
    }
    
    private func justify(left: Int, right: Int, words: [String], maxWidth: Int) -> String {
        if right == left {
            return pad(result: words[left], maxWidth: maxWidth)
        }
        let isLastLine = (right == words.count - 1)
        let spaceCount = right - left
        let totalSpace = maxWidth - wordsLength(left: left, right: right, words: words)
        
        /// distribute the space evenly as possible
        let space = isLastLine ? " " : blank(count: totalSpace / spaceCount)
        /// record if the space distribute not evenly, how many space should append from left to right
        var remainder = isLastLine ? 0 : totalSpace % spaceCount
        
        var result = ""
        for i in left...right {
            result += words[i]
            result += space
            result += (remainder > 0 ? " " : "")
            remainder -= 1
        }
        result = result.trimingTrailingSpace()
        return pad(result: result, maxWidth: maxWidth)
    }
    
    private func wordsLength(left: Int, right: Int, words: [String]) -> Int {
        var length: Int = 0
        for index in left...right {
            length += words[index].count
        }
        return length
    }
    
    private func pad(result: String, maxWidth: Int) -> String {
        return result + blank(count: maxWidth - result.count)
    }
    
    private func blank(count: Int) -> String {
        guard count >= 0 else {
            return ""
        }
        return String(Array(repeating: " ", count:count))
    }
}

private extension String {
    func trimingTrailingSpace(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }
        return String(self[...index])
    }
}

var words = ["This", "is", "an", "example", "of", "text", "justification."]
var maxWidth = 16
let results1 = Solution().fullJustify(words, maxWidth)
for line in results1 {
    print("[\(line)] \(line.count)")
}

print("\n---\n")


words = ["What","must","be","acknowledgment","shall","be"]
maxWidth = 16
let results2 = Solution().fullJustify(words, maxWidth)
for line in results2 {
    print("[\(line)] \(line.count)")
}


print("\n---\n")
words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
maxWidth = 20
let results3 = Solution().fullJustify(words, maxWidth)
for line in results3 {
    print("[\(line)] \(line.count)")
}
