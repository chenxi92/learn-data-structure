import Foundation

/**
 # https://leetcode.com/problems/permutations/

 # Given an array nums of distinct integers, return all the possible permutations.
 # You can return the answer in any order.

 # Constraints:
 # 1 <= nums.length <= 6
 # -10 <= nums[i] <= 10
 # All the integers of nums are unique.
 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        if nums.isEmpty {
            return ans
        }
        /// Add element to queue
        ans.append([])
        
        /// Loop over input
        for num in nums {
        
            /// Loop over current queue size
            for _ in 0..<ans.count {
                
                /// Remove first element from queue
                let prefix = ans.removeFirst()
                
                /// Use the removed element
                for j in 0 ... prefix.count {
                    var tmp = prefix
                    tmp.insert(num, at: j)
                    ans.append(tmp)
                }
            }
        }
        return ans
    }
}

let nums = [1, 2, 3]
print(Solution().permute(nums))
