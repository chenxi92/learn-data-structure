# coding: utf-8


def merge(nums1, m, nums2, n):
    p = m + n - 1
    p1 = m - 1
    p2 = n - 1
    while p1 >= 0 and p2 >= 0:
        if nums1[p1] >= nums2[p2]:
            nums1[p] = nums1[p1]
            p1 -= 1
        else:
            nums1[p] = nums2[p2]
            p2 -= 1
        p -= 1
    if p2 >= 0:
        nums1[p] = nums2[p2]
        p2 -= 1
        p -= 1
    return nums1


nums1 = [1, 4, 5, 7, 9, 0, 0, 0, 0]
nums2 = [2, 3, 6, 8]
print merge(nums1, 5, nums2, 4)
