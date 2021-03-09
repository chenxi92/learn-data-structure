import Foundation

/**
 # https://leetcode.com/problems/combination-sum-ii/

 # Given a collection of candidate numbers (candidates) and a target
 # number (target), find all unique combinations in candidates
 # where the candidate numbers sum to target.
 # Each number in candidates may only be used once in the combination.
 # Note: The solution set must not contain duplicate combinations.

 # Constraints:
 # 1 <= candidates.length <= 100
 # 1 <= candidates[i] <= 50
 # 1 <= target <= 30
 */

class Solution {
    private func dfs(_ path: inout [Int], _ curr: Int, _ target: Int, _ counter: inout [[Int]], _ result: inout [[Int]]) {
        if target < 0 {
            return
        } else if target == 0 {
            result.append(path)
            return
        }

        for nextCur in curr..<counter.count {
            let candidate = counter[nextCur][0]
            let freq = counter[nextCur][1]
            if freq < 1 {
                continue
            }
            path.append(candidate)
            counter[nextCur][1] = freq - 1
            
            dfs(&path, nextCur, target - candidate, &counter, &result)
            
            counter[nextCur] = [candidate, freq]
            path.removeLast()
        }
    }
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans: [[Int]] = []
        var mapping: [Int: Int] = [:]
        for i in candidates {
            if mapping.keys.contains(i) {
                mapping[i]! += 1
            } else {
                mapping[i] = 1
            }
        }
        var counter: [[Int]] = []
        for key in mapping.keys {
            counter.append([key, mapping[key]!])
        }
        print("counter = ", counter)
        var path: [Int] = []
        dfs(&path, 0, target, &counter, &ans)
        return ans
    }
}

let candidates = [10, 1, 2, 7, 6, 1, 5]
print("candidates = ", candidates)
print("result = ", Solution().combinationSum2(candidates, 8))
