import Foundation


func longestPalindrome(_ s: String) -> String {
    guard s.count > 0 else {
        return ""
    }
    
    var start = 0
    var end = 0
    let characterArray = Array(s)
    for (i, _) in s.enumerated() {
        let (left1, right1) = expandAroundCenter(characterArray, i, i)
        let (left2, right2) = expandAroundCenter(characterArray, i, i + 1)
        if right1 - left1 > (end - start) {
            start = left1
            end = right1
        }
        if right2 - left2 > (end - start) {
            start = left2
            end = right2
        }
    }
    let startIndex = s.index(s.startIndex, offsetBy: start)
    let endIndex = s.index(s.startIndex, offsetBy: end)
    return String(s[startIndex..<endIndex])
}

/// return palinadrome range [lfet, right)
func expandAroundCenter(_ s: [Character], _ left: Int, _ right: Int) -> (Int, Int) {
    var leftIndex = left
    var rightIndex = right
    while (leftIndex >= 0 && rightIndex < s.count && s[leftIndex] == s[rightIndex]) {
        leftIndex -= 1
        rightIndex += 1
    }
    return (leftIndex + 1, rightIndex)
}

assert(longestPalindrome("abacd") == "aba")
assert(longestPalindrome("babad") == "bab")
