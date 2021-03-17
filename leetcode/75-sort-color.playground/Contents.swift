import Foundation

/**
 # https://leetcode.com/problems/sort-colors/
 # Given an array nums with n objects colored red, white, or blue, sort them
 # in-place so that objects of the same color are adjacent, with the colors in
 # the order red, white, and blue. We will use the integers 0, 1, and 2 to
 # represent the color red, white, and blue, respectively.

 # Constraints:
 # n == nums.length
 # 1 <= n <= 300
 # nums[i] is 0, 1, or 2.
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var ptr = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                nums.swapAt(i, ptr)
                ptr += 1
            }
        }
        for i in ptr..<nums.count {
            if nums[i] == 1 {
                nums.swapAt(i, ptr)
                ptr += 1
            }
        }
    }
    
    func sortColors1(_ nums: inout [Int]) {
        var p0 = 0
        var p1 = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                if p0 < p1 {
                    nums.swapAt(i, p1)
                }
                p0 += 1
                p1 += 1
            } else if nums[i] == 1 {
                nums.swapAt(i, p1)
                p1 += 1
            }
        }
    }
}

var nums = [2, 0, 2, 1, 1, 0]
print(nums)
print("--- after sort ---")
Solution().sortColors1(&nums)
print(nums)
