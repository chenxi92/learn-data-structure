/**
 https://leetcode.com/problems/gray-code/
 
 An n-bit gray code sequence is a sequence of 2n integers where:

 Every integer is in the inclusive range [0, 2n - 1],
 The first integer is 0,
 An integer appears no more than once in the sequence,
 The binary representation of every pair of adjacent integers differs by exactly one bit, and
 The binary representation of the first and last integers differs by exactly one bit.
 Given an integer n, return any valid n-bit gray code sequence.
 */
import Foundation

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result: [Int] = []
        let end = 1<<n
        for i in stride(from: 0, to: end, by: 1) {
            /// ^(xor) operation explanation:
            /// If two bits are the same, the result is 0, otherwise, the result is 1
            result.append(i ^ i>>1)
        }
        return result
    }
    
    func grayCode1(_ n: Int) -> [Int] {
        var result: [Int] = []
        result.append(0)
        for i in 0..<n {
            let size = result.count
            for k in stride(from: size - 1, through: 0, by: -1) {
                let v = result[k]
                result.append(v | 1<<i)
            }
        }
        return result
    }
}

print(Solution().grayCode(2))
print(Solution().grayCode1(2))
