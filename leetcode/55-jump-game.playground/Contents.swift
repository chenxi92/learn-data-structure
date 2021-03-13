import Foundation

/**
 # https://leetcode.com/problems/jump-game/

 # Given an array of non-negative integers nums, you are initially
 # positioned at the first index of the array.
 # Each element in the array represents your maximum jump length at that
 # position. Determine if you are able to reach the last index.
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var rightMost = 0
        for i in 0..<nums.count {
            if i > rightMost {
                continue
            }
            rightMost = max(rightMost, i + nums[i])
            if rightMost >= (nums.count - 1) {
                return true
            }
        }
        return false
    }
}

print(Solution().canJump([3, 2, 1, 0, 4]))
print(Solution().canJump([0, 2, 3]))
print(Solution().canJump([0]))
