import Foundation

/**
 # https://leetcode.com/problems/subsets/
 # Given an integer array nums of unique elements, return all possible subsets (the power set).
 # The solution set must not contain duplicate subsets. Return the solution in any order.

 # Constraints:
 # 1 <= nums.length <= 10
 # -10 <= nums[i] <= 10
 # All the numbers of nums are unique.
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        results.append([])
        for i in 0..<nums.count {
            for output in results {
                results.append(output + [nums[i]])
            }
        }
        
        return results
    }
    
    private func trackback(_ input: [Int], _ result: inout [[Int]], _ start: inout Int, _ path: inout [Int], _ length: Int) {
        if path.count == length {
            result.append(path)
            return
        }
        var begin = start
        for i in start..<input.count {
            path.append(input[i])
            begin += 1
            self.trackback(input, &result, &begin, &path, length)
            path.popLast()
        }
    }
    
    func subsets1(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var cur: [Int] = []
        var start: Int = 0
        for i in 0...nums.count {
            trackback(nums, &results, &start, &cur, i)
        }
        
        return results
    }
    
    func subsets2(_ nums: [Int]) -> [[Int]] {
        let n = 1 << nums.count
        var results = [[Int]](repeating: [Int](), count: n)
        for i in 0..<nums.count {
            for j in 0..<n {
                print("\(j) > \(i) = ",  (j >> i) , ((j >> i) & 1))
                if (j >> i) & 1 != 0 {
                    results[j].append(nums[i])
                }
            }
            print(results)
        }
        return results
    }
}

let nums = [1, 2, 3]
print(Solution().subsets(nums))
print(Solution().subsets1(nums))
print(Solution().subsets2(nums))


