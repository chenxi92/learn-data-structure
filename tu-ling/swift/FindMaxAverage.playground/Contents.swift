import Foundation

/**
 给一个整数数组，找出平均数最大且长度为k的下标连续的子数组，并输出该最大平均数。

 输入：[1, 12, -5, -6, 50, 3], k = 4

 输出：12.75

 最大平均数 ( 12 - 5 - 6 + 50) / 4 = 12.75
 */

func findMaxAverage(_ nums: [Int], _ k: Int) -> Float {
    guard nums.count >= k else {
        return 0
    }
    
    var sum = 0
    for i in 0..<k {
        sum += nums[i]
    }
    var maxSum = 0
    for i in k..<nums.count {
        sum = sum - nums[i - k] + nums[i]
        maxSum = max(sum, maxSum)
    }
    return Float(maxSum) / Float(k)
}

let nums = [1, 12, -5, -6, 50, 3]
print(findMaxAverage(nums, 4))
