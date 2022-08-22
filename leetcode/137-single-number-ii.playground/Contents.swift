/**
 https://leetcode.com/problems/single-number-ii/
 
 Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */
import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dic: [Int: Int] = [:]
        nums.forEach { num in
            if let value = dic[num] {
                dic[num] = value + 1
            } else {
                dic[num] = 1
            }
        }
        for pair in dic {
            if pair.value == 1 {
                return pair.key
            }
        }
        return 0
    }
    
}

let nums1 = [2, 2, 3, 2]
let nums2 = [0, 1, 0, 1, 0, 1, 99]
assert(Solution().singleNumber(nums1) == 3)
assert(Solution().singleNumber(nums2) == 99)
print("--- passed test")
