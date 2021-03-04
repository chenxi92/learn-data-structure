import Foundation

/**
 # https://leetcode.com/problems/4sum/

 # Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target?
 # Find all unique quadruplets in the array which gives the sum of target.
 # Notice that the solution set must not contain duplicate quadruplets.

 # Constraints:
 # 0 <= nums.length <= 200
 # -109 <= nums[i] <= 109
 # -109 <= target <= 109

 */

class Solution {
    private func threeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        var output = [[Int]]()
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == target {
                    output.append([nums[i], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return output
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        let sortedNums = nums.sorted()
        print(sortedNums)
        var output: [[Int]] = [[Int]]()
        for i in 0..<sortedNums.count - 3 {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            let startIndex = sortedNums.index(i, offsetBy: 1)
            let endindex = sortedNums.endIndex
            let subNums = Array(sortedNums[startIndex ..< endindex])
            let threeResult = threeSum(subNums, target - sortedNums[i])
            for var ret in threeResult {
                ret.append(sortedNums[i])
                output.append(ret)
            }
        }
        return output
    }
}

//print(Solution().fourSum([1, 0, -1, 0, -2, 2], 0))
print(Solution().fourSum([0, 0, 0, 0], 0))
