#### x的平方根-二分查找

在不适用 sqrt(x) 函数的情况下，得到 x 的平方根的整数部分；



##### 解题思路

暴力破解：

1. 从 0 到 x 之间找到 i， 如果 i * i <= x 并且 (i + 1) * (i + 1)  > x, 则 i 为平方根的整数部分；时间复杂度为 O(n);

二分查找法：

在暴力破解的基础上采用二分查找来寻找整数部分， 时间复杂度降低到 log(n) 

##### 代码

```python
# coding: utf-8


def binarySearch(x):
    index = -1
    left = 0
    right = x
    while left <= right:
        mid = left + (right - left) / 2
        if mid * mid <= x:
            index = mid
            left = mid + 1
        else:
            right = mid - 1
    return index


print binarySearch(24)

```

