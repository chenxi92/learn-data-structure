import Foundation

/**
 
 # https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 # Given a sorted array nums, remove the duplicates in-place such that
 # duplicates appeared at most twice and return the new length.
 # Do not allocate extra space for another array; you must do this by
 # modifying the input array in-place with O(1) extra memory.

 # Constraints:
 # 1 <= nums.length <= 3 * 104
 # -104 <= nums[i] <= 104
 # nums is sorted in ascending order.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var count = 1
        var index = 1
        while index < nums.count {
            if nums[index] == nums[index - 1] {
                count += 1
                if count > 2 {
                    nums.remove(at: index)
                    index -= 1
                }
            } else {
                count = 1
            }
            index += 1
        }
        return nums.count
    }
    
    func removeDuplicates1(_ nums: inout [Int]) -> Int {
        var count = 1
        var j = 1
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                count += 1
            } else {
                count = 1
            }
            if count <= 2 {
                nums[j] = nums[i]
                j += 1
            }
        }
        return j
    }
}


var nums: [Int] = [1, 1, 1, 2, 2, 3]
print(nums)
print(Solution().removeDuplicates(&nums))
print(nums)
