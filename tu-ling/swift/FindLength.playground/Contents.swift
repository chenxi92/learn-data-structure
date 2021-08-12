import Foundation

/**
 给定一个未经排序的整数数组，找到最长且连续递增的子序列， 并返回该序列的长度。
 */

func findLength(_ nums: [Int]) -> Int {
    var maxLength = 0
    var start = 0
    for i in 1..<nums.count {
        if nums[i] <= nums[i - 1] {
            start = i
        }
        maxLength = max(maxLength, i - start + 1)
    }
    return maxLength
}


let nums = [1, 2, 4, 1, 3, 5, 6]
print(findLength(nums))
