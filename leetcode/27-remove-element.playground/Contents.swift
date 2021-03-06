import Foundation

/**
 # https://leetcode.com/problems/remove-element/

 # Given an array nums and a value val,
 # remove all instances of that value in-place and return the new length.

 # Constraints:
 # 0 <= nums.length <= 100
 # 0 <= nums[i] <= 50
 # 0 <= val <= 100
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var n = nums.count
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n - 1]
                n -= 1
            } else {
                i += 1
            }
        }
        return i
    }
    
    func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = 0
        while j < nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
            j += 1
        }
        return i
    }
}

var nums1 = [3, 3, 3, 2, 2]
print(Solution().removeElement1(&nums1, 3))
print(nums1)
