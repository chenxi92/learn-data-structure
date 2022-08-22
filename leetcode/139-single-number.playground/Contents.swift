/**
 https://leetcode.com/problems/single-number/
 
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */
import Foundation

var greeting = "Hello, playground"

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    func singleNumber1(_ nums: [Int]) -> Int {
        nums.reduce(0) { $0^$1 }
    }
    
    func singleNumber2(_ nums: [Int]) -> Int {
        var dic: [Int: Int] = [:]
        for num in nums {
            if let value = dic[num] {
                dic[num] = value + 1
            } else {
                dic[num] = 1
            }
        }
        for (_ , v) in dic.enumerated() {
            if v.value == 1 {
                return v.key
            }
        }
        return 0
    }
}

assert(Solution().singleNumber([2, 2, 1]) == 1)
assert(Solution().singleNumber([4, 1, 2, 1, 2]) == 4)
assert(Solution().singleNumber([1]) == 1)

assert(Solution().singleNumber1([2, 2, 1]) == 1)
assert(Solution().singleNumber1([4, 1, 2, 1, 2]) == 4)
assert(Solution().singleNumber1([1]) == 1)
print("--- passed xor algorithm")

assert(Solution().singleNumber2([2, 2, 1]) == 1)
assert(Solution().singleNumber2([4, 1, 2, 1, 2]) == 4)
assert(Solution().singleNumber2([1]) == 1)
print("--- passed dic map")


