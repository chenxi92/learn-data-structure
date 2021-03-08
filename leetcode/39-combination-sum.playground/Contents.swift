import UIKit

/**
 # https://leetcode.com/problems/combination-sum/

 # Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target.
 # You may return the combinations in any order.
 # The same number may be chosen from candidates an unlimited number of times.
 # Two combinations are unique if the frequency of at least one of the chosen numbers is different.
 # It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 # Constraints:
 # 1 <= candidates.length <= 30
 # 1 <= candidates[i] <= 200
 # All elements of candidates are distinct.
 # 1 <= target <= 500
 
 */

class Solution {
    private func dfs(_ nums: [Int], _ target: Int, _ path: [Int], _ ret: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            ret.append(path)
            return
        }
        for (i, v) in nums.enumerated() {
            if v > target {
                continue
            }
            let start = nums.index(nums.startIndex, offsetBy: i)
            let end = nums.endIndex
            dfs(Array(nums[start..<end]), target - v, path + [v], &ret)
        }
    }
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ret: [[Int]] = []
        dfs(candidates, target, [], &ret)
        return ret
    }
}

print(Solution().combinationSum([2, 3, 6, 9, 7, 8], 7))
