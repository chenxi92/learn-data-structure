import Foundation

/**
 # https://leetcode.com/problems/search-insert-position/
 # Given a sorted array of distinct integers and a target value,
 # return the index if the target is found.
 # If not, return the index where it would be if it were inserted in order.

 # Constraints:
 # 1 <= nums.length <= 104
 # -104 <= nums[i] <= 104
 # nums contains distinct values sorted in ascending order.
 # -104 <= target <= 104
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for i in 0..<nums.count {
            if nums[i] >= target {
                return i
            }
        }
        return nums.count
    }
    
    func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count
        while start < end {
            let mid = (start + end) / 2
            if nums[mid] >= target {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
}

print(Solution().searchInsert([1, 3, 5, 6], 5))
print(Solution().searchInsert([1, 3, 5, 6], 2))
print(Solution().searchInsert([1, 3, 5, 6], 7))
print(Solution().searchInsert([1, 3, 5, 6], 0))
print(Solution().searchInsert([1], 0))
print("------")
print(Solution().searchInsert1([1, 3, 5, 6], 5))
print(Solution().searchInsert1([1, 3, 5, 6], 2))
print(Solution().searchInsert1([1, 3, 5, 6], 7))
print(Solution().searchInsert1([1, 3, 5, 6], 0))
print(Solution().searchInsert1([1], 0))
