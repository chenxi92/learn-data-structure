import Foundation

/**
 # https://leetcode.com/problems/3sum-closest/

 # Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target.
 # Return the sum of the three integers.
 # You may assume that each input would have exactly one solution.

 # Constraints:
 # 3 <= nums.length <= 10^3
 # -10^3 <= nums[i] <= 10^3
 # -10^4 <= target <= 10^4
 */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        var result = nums[0] + nums[1] + nums[nums.count - 1]
        for i in 0..<sortedNums.count - 2 {
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum == target {
                    return target
                } else if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
                if abs(target - sum) < abs(target - result) {
                    result = sum
                }
            }
        }
        return result
    }
}

print(Solution().threeSumClosest([-1,2,1,-4], 3))
print(Solution().threeSumClosest([0, 1, 2], 3))
