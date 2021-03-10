import Foundation

/**
 # https://leetcode.com/problems/subsets-ii/

 # Given an integer array nums that may contain duplicates, return all possible
 # subsets (the power set). The solution set must not contain duplicate subsets.
 # Return the solution in any order.

 # Constraints:
 # 1 <= nums.length <= 10
 # -10 <= nums[i] <= 10
 */

class Solution {
    
    func subsetWithDup(_ nums: [Int]) -> [[Int]] {
        var results: Set<[Int]> = Set()
        var path: [Int] = []
        
        func dfs(_ nums: [Int], _ path: inout [Int], _ results: inout Set<[Int]>, _ start: Int) {
            results.insert(path)
            for i in start..<nums.count {
                path.append(nums[i])
                
                dfs(nums, &path, &results, i + 1)
                
                path.removeLast()
            }
        }
        
        dfs(nums.sorted(), &path, &results, 0)
        return Array(results)
    }
    
    func subsetWithDup1(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        if nums.isEmpty {
            return results
        }
        
        let sortedNums = nums.sorted()
        results.append([])
        var i = 0
        while i < sortedNums.count {
            var dupCount = 0
            while i + 1 < sortedNums.count && sortedNums[i] == sortedNums[i + 1] {
                i += 1
                dupCount += 1
            }
            
            let size = results.count
            for j in 0..<size {
                var element = Array(results[j])
                for _ in 0...dupCount {
                    element += [sortedNums[i]]
                    results.append(element)
                }
            }
            
            i += 1
        }
        return results
    }
    
    /// Input [1, 2, 2]
    /// []  insert, [[]]
    /// [1] insert, [[], [1]]
    /// [2] insert, [[], [1], [2], [1, 2]]
    /// [2] insert, [[], [1], [2], [1, 2], [2, 2], [1, 2, 2]]
    func subsetWithDup2(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        results.append([])
        var count = results.count
        let sortedNums = nums.sorted()
        for (i, num) in sortedNums.enumerated() {
            let start = (i > 0 && sortedNums[i - 1] == num) ? count : 0
            count = results.count
            for j in start..<count {
                results.append(results[j] + [num])
            }
        }
        return results
    }
}

let nums = [1, 2, 2]

print(Solution().subsetWithDup(nums))
print(Solution().subsetWithDup1(nums))
print(Solution().subsetWithDup2(nums))
