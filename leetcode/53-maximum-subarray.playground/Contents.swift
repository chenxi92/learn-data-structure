import Foundation

/**
 # https://leetcode.com/problems/maximum-subarray/

 # Given an integer array nums, find the contiguous subarray (containing
 # at least one number) which has the largest sum and return its sum.

 # Constraints:
 # 1 <= nums.length <= 3 * 104
 # -105 <= nums[i] <= 105
 */

class Solution {
    func maxSuarray(_ nums: [Int]) -> Int {
        var ans = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            ans = max(ans, sum)
        }
        return ans
    }
}

let nums =  [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print(Solution().maxSuarray(nums))
