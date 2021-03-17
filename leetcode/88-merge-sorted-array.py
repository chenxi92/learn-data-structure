# coding: utf-8

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


class Solution(object):
    def merge(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: None Do not return anything, modify nums1 in-place instead.
        """
        p1 = m - 1
        p2 = n - 1
        p = m + n - 1
        while p1 >= 0 and p2 >= 0:
            if nums1[p1] < nums2[p2]:
                nums1[p] = nums2[p2]
                p2 -= 1
            else:
                nums1[p] = nums1[p1]
                p1 -= 1
            p -= 1
        while p1 >= 0:
            nums1[p] = nums1[p1]
            p1 -= 1
            p -= 1
        while p2 >= 0:
            nums1[p] = nums2[p2]
            p2 -= 1
            p -= 1


nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3
Solution().merge(nums1, m, nums2, n)
print nums1
