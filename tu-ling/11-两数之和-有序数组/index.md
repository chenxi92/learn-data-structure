#### 两数之和-有序数组

给定一个 **升序排列的** 整数数组 nums， 从数组中找出两个数满足相加之和等于目标数 target。

假设每个输入只对应唯一的答案，而且不可以重复使用相同的元素。

放回两数的下标，以数组形式返回。



##### 解题思路

###### 二分法

通过 **二分法** 在有序数组中依次开始查找：

时间复杂度：N*(logN)

空间复杂度: O(N)



###### 双指针

一个慢指针指向开头，一个快指针指向末尾，向中间移动快慢指针，直至找到解或者解决查找；

时间复杂度：O(N)

空间复杂度: O(1)



##### 代码

```python
# coding: utf-8


def solution(nums, target):
    for i in range(len(nums)):
        low = i
        high = len(nums) - 1
        while low <= high:
            mid = low + (high - low) / 2
            if nums[i] + nums[mid] == target:
                return [i, mid]
            elif nums[i] + nums[mid] > target:
                high = mid - 1
            else:
                low = mid + 1
    return [-1, -1]


def twoPointer(nums, target):
    low = 0
    high = len(nums) - 1
    while low < high:
        if nums[low] + nums[high] == target:
            return [low, high]
        elif nums[low] + nums[high] > target:
            high -= 1
        else:
            low += 1
    return [-1, -1]


nums = [1, 2, 3, 4, 5, 6]
target = 8
print solution(nums, target)
print twoPointer(nums, target)

```

