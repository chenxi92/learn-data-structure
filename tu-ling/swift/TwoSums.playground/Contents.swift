import Foundation

/// 给定一个整数数组 nums， 从数组中找出两个数满足相加之和等于目标数 target。
/// 假设每个输入只对应唯一的答案，而且不可以重复使用相同的元素。
/// 放回两数的下标，以数组形式返回。

func solutions(_ nums: [Int], _ target: Int) -> (Int, Int) {
    var map:[Int: Int] = [:]
    for x in 0..<nums.count {
        let num = nums[x]
        if map[target - num] != nil {
            return (x, map[target - num]!)
        } else {
            map[num] = x
        }
    }
    return (-1, -1)
}

print(solutions([1, 2, 3, 4, 5, 6], 9))


/// 给定一个 **升序排列的** 整数数组 nums， 从数组中找出两个数满足相加之和等于目标数 target。
/// 假设每个输入只对应唯一的答案，而且不可以重复使用相同的元素。
/// 返回两数的下标，以数组形式返回。
func solutions1(_ nums: [Int], _ target: Int) -> (Int, Int) {
    for i in 0..<nums.count {
        var low = i
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[i] + nums[mid] == target {
                return (i, mid)
            } else if nums[i] + nums[mid] > target {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
    }
    return (-1, -1)
}

func solutions2(_ nums: [Int], _ target: Int) -> (Int, Int) {
    var low = 0
    var high = nums.count - 1
    while low < high {
        if nums[low] + nums[high] == target {
            return (low, high)
        } else if nums[low] + nums[high] > target {
            high -= 1
        } else {
            low += 1
        }
    }
    return (-1, -1)
}
print(solutions1([1, 2, 3, 4, 5, 6], 8))
print(solutions2([1, 2, 3, 4, 5, 6], 8))
