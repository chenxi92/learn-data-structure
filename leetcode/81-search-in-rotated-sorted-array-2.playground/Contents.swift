import Foundation

/**
 # There is an integer array nums sorted in non-decreasing order
 # (not necessarily with distinct values). Before being passed to your
 # function, nums is rotated at an unknown pivot index k (0 <= k < nums.length)
 # such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1],
 # nums[0], nums[1], ..., nums[k-1]] (0-indexed).
 # For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and
 # become [4,5,6,6,7,0,1,2,4,4].
 # Given the array nums after the rotation and an integer target,
 # return true if target is in nums, or false if it is not in nums.

 # Constraints:
 # 1 <= nums.length <= 5000
 # -104 <= nums[i] <= 104
 # nums is guaranteed to be rotated at some pivot.
 # -104 <= target <= 104
 */

/**
 # input: [4, 5, 6, 6, 7, 0, 1, 2, 4, 4]
 # first sorted array: [4, 5, 6, 6, 7]
 # second sorted array: [0, 1, 2, 4, 4]
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.count > 0 else {
            return false
        }
        
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return true
            }
            
            // when mid == start, it may belong both first and second sorted array
            if nums[start] == nums[mid] {
                start += 1
                continue
            }
            
            let pivotArray = (nums[start] <= nums[mid]) ? 1 : 0
            let targetArray = (nums[start] <= target) ? 1 : 0
            if (pivotArray ^ targetArray) == 1 { // in different sorted array
                if pivotArray == 1 { // mid in the first sorted array
                    start = mid + 1
                } else {
                    end = mid
                }
            } else { // mid and target in the same sorted array
                if target > nums[mid] {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
        }
        return false
    }
}

let nums = [4, 5, 6, 6, 7, 0, 1, 2, 4, 4]
print(Solution().search(nums, 4))
