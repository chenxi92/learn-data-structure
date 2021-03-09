import Foundation

/**
 # https://leetcode.com/problems/permutations-ii/

 # Given a collection of numbers, nums, that might contain duplicates,
 # return all possible unique permutations in any order.

 # Constraints:
 # 1 <= nums.length <= 8
 # -10 <= nums[i] <= 10
 */

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        var ans = [[Int]]()
        ans.append([])
        for num in nums {
            for _ in 0..<ans.count {
                let prefix = ans.removeFirst()
                for i in 0...prefix.count {
                    var tmp = Array(prefix)
                    tmp.insert(num, at: i)
                    ans.append(tmp)
                    if i < prefix.count && prefix[i] == num {
                        break
                    }
                }
            }
        }
        return ans
    }
    
    private func backtrack(_ comb: inout [Int], _ counter: inout [Int:Int], _ result: inout [[Int]], _ length: Int) {
        if comb.count == length {
            result.append(comb)
            return
        }
        for num in counter.keys {
            let freq = counter[num]!
            if freq > 0 {
                counter[num]! -= 1
                comb.append(num)
                
                backtrack(&comb, &counter, &result, length)
                
                counter[num]! += 1
                comb.popLast()
            }
        }
    }
    
    func permuteUnique1(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var counter: [Int: Int] = [:]
        for num in nums {
            if counter.keys.contains(num) {
                counter[num]! += 1
            } else {
                counter[num] = 1
            }
        }
        var comb: [Int] = []
        self.backtrack(&comb, &counter, &ans, nums.count)
        return ans
    }
}


let nums = [1, 2, 3]
print(Solution().permuteUnique(nums))
print(Solution().permuteUnique1(nums))

let nums1 = [1, 1, 2]
print(Solution().permuteUnique(nums1))
print(Solution().permuteUnique1(nums1))
