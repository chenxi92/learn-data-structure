#### 合并两个有序数组

两个有序整数数组 nums1 和 nuns2， 将 nums2 合并到 nums1 中，使 nums1 称为一个有序数组。

初始化 nums1 和 nums2 的元素数量分别为 m 和 n。

假设 nums1 的空间大小等于 m + n，这样他就有足够的空间保存来自 nums2 的元素。



##### 解题思路

###### 双指针

借助双指针（分别记录 nums1 和 nums2 当前遍历位置）从后往前合并数组 nums1，每次取最大值放在后面。

合并完成后，判断 nums2 是否完成遍历，如果没有完成则把 nums2 数据依次放到 nums1中。

时间复杂度：O(N)

空间复杂度：O(1)



##### 代码

```python
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

```

