import Foundation

/**
 # https://leetcode.com/problems/search-in-rotated-sorted-array/

 # There is an integer array nums sorted in ascending order (with distinct
 # values). Prior to being passed to your function, nums is rotated at an
 # unknown pivot index k (0 <= k < nums.length) such that the resulting array
 # is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]
 # (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3
 # and become [4,5,6,7,0,1,2].

 # Given the array nums after the rotation and an integer target,
 # return the index of target if it is in nums, or -1 if it is not in nums.

 # Constraints:
 # 1 <= nums.length <= 5000
 # -104 <= nums[i] <= 104
 # All values of nums are unique.
 # nums is guaranteed to be rotated at some pivot.
 # -104 <= target <= 104
 */

/// Input [4, 5, 6, 7, 0, 1, 2]
/// if target is 1: [-inf, -inf, -inf, -inf, 0, 1, 2]
/// if target is 5: [4, 5, 6, 7, inf, inf, inf]

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if (nums[0] > nums[mid]) == (nums[0] > target) {
                if nums[mid] > target {
                    high = mid
                } else if nums[mid] < target {
                    low = mid + 1
                } else {
                    return mid
                }
            } else if nums[0] > target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return -1
    }
}

print(Solution().search([4, 5, 6, 7, 0, 1, 2], 0))
print(Solution().search([5, 1, 3], 5))
print(Solution().search([1], 1))
