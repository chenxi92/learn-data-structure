import Foundation

/**
 # https://leetcode.com/problems/3sum/

 # Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0?
 # Find all unique triplets in the array which gives the sum of zero.
 # Notice that the solution set must not contain duplicate triplets.

 # Constraints:
 # 0 <= nums.length <= 3000
 # -105 <= nums[i] <= 105
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        var ret = [[Int]]()
        let sortedNums = nums.sorted()
        for (i, v) in sortedNums.enumerated() {
            if i > 0 && sortedNums[i - 1] == sortedNums[i] {
                continue
            }
            let sum = -v
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                if sortedNums[left] + sortedNums[right] == sum {
                    ret.append([v, sortedNums[left], sortedNums[right]])
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sortedNums[left] + sortedNums[right] < sum {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return ret
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4]))
print(Solution().threeSum([0, 0, 0]))
print(Solution().threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]))
