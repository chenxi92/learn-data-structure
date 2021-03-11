import UIKit

/**
 # https://leetcode.com/problems/next-permutation/

 # Implement next permutation, which rearranges numbers into the
 # lexicographically next greater permutation of numbers.
 # If such an arrangement is not possible, it must rearrange it as
 # the lowest possible order (i.e., sorted in ascending order).
 # The replacement must be in place and use only constant extra memory.

 # Constraints:
 # 1 <= nums.length <= 100
 # 0 <= nums[i] <= 100
 */

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        while i >= 0 && nums[i] >= nums[i + 1]{
            i -= 1
        }
        if i >= 0 {
            var j = nums.count - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        var start = i + 1
        var end = nums.count - 1
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

var nums = [1, 5, 8, 4, 7, 6, 5, 3, 1]
print(nums)
Solution().nextPermutation(&nums)
print(nums)
