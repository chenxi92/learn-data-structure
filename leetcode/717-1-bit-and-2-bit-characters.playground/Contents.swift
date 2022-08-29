/**
 https://leetcode.com/problems/1-bit-and-2-bit-characters/
 
 We have two special characters:

 The first character can be represented by one bit 0.
 The second character can be represented by two bits (10 or 11).
 
 Given a binary array bits that ends with 0, return true if the last character must be a one-bit character.
 */
import Foundation

class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var ones = 0
        // Loop from the penultimate because the last one is always 0
        var i = bits.count - 2
        while i >= 0 && bits[i] != 0 {
            ones += 1
            i -= 1
        }
        return ones % 2 == 0
    }
    
    func isOneBitCharacter1(_ bits: [Int]) -> Bool {
        let count = bits.count - 1
        var i = 0
        while i < count {
            if bits[i] == 0 {
                i += 1
            } else {
                i += 2
            }
        }
        return i == count
    }
}

assert(Solution().isOneBitCharacter([1, 0, 0]))
assert(Solution().isOneBitCharacter([1, 1, 1, 0]) == false)

assert(Solution().isOneBitCharacter1([1, 0, 0]))
assert(Solution().isOneBitCharacter1([1, 1, 1, 0]) == false)
print("passed test")
