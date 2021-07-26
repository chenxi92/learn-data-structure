import Foundation

/**
 两个有序整数数组 nums1 和 nuns2， 将 nums2 合并到 nums1 中，使 nums1 称为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。

 假设 nums1 的空间大小等于 m + n，这样他就有足够的空间保存来自 nums2 的元素。
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p = m + n - 1
    var p1 = m - 1
    var p2 = n - 1
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] >= nums2[p2] {
            nums1[p] = nums1[p1]
            p1 -= 1
        } else {
            nums1[p] = nums2[p2]
            p2 -= 1
        }
        p -= 1
    }
    if p2 >= 0 {
        nums1[p] = nums2[p2]
        p2 -= 1
        p -= 1
    }
}

var nums1 = [1, 4, 5, 7, 9, 0, 0, 0, 0]
let nums2 = [2, 3, 6, 8]
merge(&nums1, 5, nums2, 4)
print(nums1)
