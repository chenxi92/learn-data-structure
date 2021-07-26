import Foundation

/// 给定一个整数数组 nums，请编写一个能够返回数组 “中心下标” 的方法。
/// 中心下标是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。
/// 如果数组不存在中心下标，返回 -1
/// 如果数组有多个中心下标，应该返回最靠近左边的那一个。

func pivotIndex(_ array: [Int]) -> Int {
    var sum = array.reduce(0, +)
    var total = 0
    for i in 0..<nums.count {
        total += nums[i]
        if total == sum {
            return i
        }
        sum -= nums[i]
    }
    return -1
}

let nums = [1, 7, 3, 6, 5, 6]
let index = pivotIndex(nums)
print(index)
