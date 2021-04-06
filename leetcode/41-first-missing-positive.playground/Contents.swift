import UIKit

/**
 # https://leetcode.com/problems/first-missing-positive/
 # Given an unsorted integer array nums,
 # find the smallest missing positive integer.

 # Constraints:
 # 0 <= nums.length <= 300
 # -231 <= nums[i] <= 231 - 1
 */

class Solution {
    func fistMissingPositive(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = Array(nums);
        for i in 0..<n {
            if nums[i] <= 0 {
                nums[i] = n + 1
            }
        }

        for i in 0..<n {
            let num = abs(nums[i])
            if num <= n {
                nums[num - 1] = -abs(nums[num - 1])
            }
        }
        for i in 0..<n {
            if nums[i] > 0 {
                return i + 1
            }
        }
        return n + 1;
    }
}

let nums = [3, 4, 1, -1]
//nums = [1]
print(Solution().fistMissingPositive(nums))
