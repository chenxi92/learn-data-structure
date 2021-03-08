import Foundation

/**
 # https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 # Given an array of integers nums sorted in ascending order, find the starting
 # and ending position of a given target value.
 # If target is not found in the array, return [-1, -1].
 # Follow up: Could you write an algorithm with O(log n) runtime complexity?

 # Constraints:
 # 0 <= nums.length <= 105
 # -109 <= nums[i] <= 109
 # nums is a non-decreasing array.
 # -109 <= target <= 109
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var leftIndex = -1
        var rightIndex = -1
        for i in 0..<nums.count {
            if nums[i] == target {
                leftIndex = i
                break
            }
        }
        if leftIndex == -1 {
            return [leftIndex, rightIndex]
        }
        var j = nums.count - 1
        while j >= 0 {
            if nums[j] == target {
                rightIndex = j
                break
            }
            j -= 1
        }
        return [leftIndex, rightIndex]
    }
    
    func searchRange1(_ nums: [Int], _ target: Int) -> [Int] {
        let extremeInsertionIndex = { (nums: [Int], target: Int, left: Bool) -> Int in
            var lo = 0
            var hi = nums.count - 1
            while lo < hi {
                let middle = (lo + hi) / 2
                if nums[middle] > target || (left && nums[middle] == target) {
                    hi = middle
                } else {
                    lo = middle + 1
                }
            }
            if left {
                return lo
            }
            return lo - 1
        }
        
        let leftIndex = extremeInsertionIndex(nums, target, true)
        if leftIndex >= nums.count || nums[leftIndex] != target {
            return [-1, -1]
        }
        return [leftIndex, extremeInsertionIndex(nums, target, false)]
    }
}

print(Solution().searchRange([5, 7, 7, 8, 8, 10], 8))
print(Solution().searchRange1([5, 7, 7, 8, 8, 10], 8))
