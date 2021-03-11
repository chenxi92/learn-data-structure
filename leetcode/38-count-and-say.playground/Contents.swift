import UIKit

class Solution {
    func countAndSay(_ n: Int) -> String {
        var prevSeq: [String] = ["1", "e"]
        let result = self.nextSequence(n, &prevSeq)
        return result.joined(separator: "")
    }
    
    /// generate ∣count, digit∣
    private func nextSequence(_ n: Int, _ prevSeq: inout [String]) -> [String] {
        if n == 1 {
            prevSeq.removeLast()
            return prevSeq
        }
        var nextSeq: [String] = []
        var prevDigit = prevSeq.removeFirst()
        var digitCnt = 1
        for digit in prevSeq {
            if digit == prevDigit {
                digitCnt += 1
            } else {
                nextSeq.append(String(digitCnt))
                nextSeq.append(prevDigit)
                prevDigit = digit
                digitCnt = 1
            }
        }
        nextSeq.append("e")
        return self.nextSequence(n - 1, &nextSeq)
    }
}


print(Solution().countAndSay(6))
