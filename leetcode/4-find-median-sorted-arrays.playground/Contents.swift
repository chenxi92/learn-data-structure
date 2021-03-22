import UIKit

/**
 # https://leetcode.com/problems/median-of-two-sorted-arrays

 # Given two sorted arrays nums1 and nums2 of size m and n respectively,
 # return the median of the two sorted arrays.

 # Constraints:
 # nums1.length == m
 # nums2.length == n
 # 0 <= m <= 1000
 # 0 <= n <= 1000
 # 1 <= m + n <= 2000
 # -106 <= nums1[i], nums2[i] <= 106
 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var ans: [Int] = []
        var i = 0
        var j = 0
        while i < nums1.count && j < nums2.count {
            if nums1[i] <= nums2[j] {
                ans.append(nums1[i])
                i += 1
            } else {
                ans.append(nums2[j])
                j += 1
            }
        }
        while i < nums1.count {
            ans.append(nums1[i])
            i += 1
        }
        while j < nums2.count {
            ans.append(nums2[j])
            j += 1
        }
        let k = ans.count
        print(ans)
        if k % 2 == 1 {
            return Double(ans[k / 2])
        } else {
            let median = Double(ans[k / 2] + ans[k / 2 - 1])
            return median / 2.0
        }
    }
}

let nums1 = [1, 3]
let nums2 = [2, 4]
print(Solution().findMedianSortedArrays(nums1, nums2))
