import Foundation

/// 一个有序数组 nums，原地删除重复出现的元素，使每个元素只出现一次，返回删除之后数组的长度。
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count < 1 {
        return 0
    }
    var i = 0
    for j in 1..<nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
    }
    
    return i + 1
}

var array = [1, 2, 2, 3, 5, 5, 6]
print(removeDuplicates(&array))
print(array)
