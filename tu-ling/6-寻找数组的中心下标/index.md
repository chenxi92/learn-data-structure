#### 寻找数组的中心下标

给定一个整数数组 nums，请编写一个能够返回数组 “中心下标” 的方法。

>  中心下标是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。
>
> 如果数组不存在中心下标，返回 -1 。如果数组有多个中心下标，应该返回最靠近左边的那一个。
>
> 注意：中心下标可能出现在数组的两端。



##### 解题思路

可以采用类似双指针的算法，一个指针计算左边的加和，一个指针计算右边的加和；

1. 求出 nums 的总和 sum；
2. 使用变量 total 表明从左到右遍历过的数组，如果找到中心下标 i，则 [0, i] 和 [i, len(nums)] 的加和相等（通过 total == sum 来判断）；
3. 如果未找到中心下标，则 sum 减去当前遍历到的值；
4. 重复 2 和 3 直到数组遍历完毕；



##### 代码

```python
# coding: utf-8


def pivotIndex(nums):
    sum = 0
    for num in nums:
        sum += num
    total = 0
    for i in range(0, len(nums)):
        total += nums[i]
        if total == sum:
            return i
        sum -= nums[i]
    return - 1


nums = [1, 7, 3, 6, 5, 6]
print pivotIndex(nums)
```

