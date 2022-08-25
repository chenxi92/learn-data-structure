/**
 https://leetcode.com/problems/longest-consecutive-sequence/
 
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.
 */
import Foundation

class Solution {
    /// Brute Force algorithm
    /// Time complexity: O(n^3)
    /// Space complexity: O(1)
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var longestStreak = 0
        
        for num in nums {
            var currentNum = num
            var currentStreak = 1
            
            while arrayContainers(nums, currentNum + 1) {
                currentNum += 1
                currentStreak += 1
            }
            
            longestStreak = max(longestStreak, currentStreak)
        }
        return longestStreak
    }
    
    private func arrayContainers(_ nums: [Int], _ num: Int) -> Bool {
        for n in nums {
            if n == num {
                return true
            }
        }
        return false
    }
    
    /// Sort Algorithm
    /// Time complexity: O(nlogn)
    /// Space complexity: O(n)
    func longestConsecutive1(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let sortedNums = nums.sorted(by: < )
        
        var longestStreak = 1
        var currentStreak = 1
        for i in stride(from: 1, to: sortedNums.count, by: 1) {
            if sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            if sortedNums[i] == sortedNums[i - 1] + 1 {
                currentStreak += 1
            } else {
                longestStreak = max(longestStreak, currentStreak)
                currentStreak = 1
            }
        }
        return max(longestStreak, currentStreak)
    }
    
    func longestConsecutive2(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var numSet: Set<Int> = []
        nums.forEach { numSet.insert($0) }
        
        var longestStreak = 0
        for num in numSet {
            if numSet.contains(num - 1) == false {
                var currentNum = num
                var currentStreak = 1
                
                while numSet.contains(currentNum + 1) {
                    currentNum += 1
                    currentStreak += 1
                }
                
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        return longestStreak
    }
}

assert(Solution().longestConsecutive([100, 4, 200, 1, 3, 2]) == 4)
assert(Solution().longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9)
print("Approach 1: Brute Force Algorithm passed test")

assert(Solution().longestConsecutive1([100, 4, 200, 1, 3, 2]) == 4)
assert(Solution().longestConsecutive1([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9)
print("Approach 2: Sort Algorithm passed test")

assert(Solution().longestConsecutive2([100, 4, 200, 1, 3, 2]) == 4)
assert(Solution().longestConsecutive2([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9)
print("Approach 3: Set and Intelligent Sequence passed test")
