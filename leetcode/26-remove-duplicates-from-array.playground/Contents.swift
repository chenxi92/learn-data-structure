import Foundation

/**
 # https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 # Given a sorted array nums, remove the duplicates in-place such that each element
 # appears only once and returns the new length.
 # Do not allocate extra space for another array, you must do this by modifying the input array
 # in-place with O(1) extra memory.

 # Constraints:
 # 0 <= nums.length <= 3 * 104
 # -104 <= nums[i] <= 104
 # nums is sorted in ascending order.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}

var nums = [1, 1, 2]
print(Solution().removeDuplicates(&nums))
