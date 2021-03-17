import Foundation

/**
 # https://leetcode.com/problems/merge-sorted-array/

 # Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as
 # one sorted array. The number of elements initialized in nums1 and nums2 are
 # m and n respectively. You may assume that nums1 has a size equal to m + n
 # such that it has enough space to hold additional elements from nums2.

 # Constraints:
 # nums1.length == m + n
 # nums2.length == n
 # 0 <= m, n <= 200
 # 1 <= m + n <= 200
 # -109 <= nums1[i], nums2[i] <= 109
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var p = m + n - 1
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] < nums2[p2] {
                nums1[p] = nums2[p2]
                p2 -= 1
            } else {
                nums1[p] = nums1[p1]
                p1 -= 1
            }
            p -= 1
        }
        while p1 >= 0 {
            nums1[p] = nums1[p1]
            p1 -= 1
            p -= 1
        }
        while p2 >= 0 {
            nums1[p] = nums2[p2]
            p2 -= 1
            p -= 1
        }
    }
}

var nums1 = [1, 2, 3, 0, 0, 0]
let m = 3
let nums2 = [2, 5, 6]
let n = 3
print(nums1)
Solution().merge(&nums1, m, nums2, n)
print("--- after merge ---")
print(nums1)
