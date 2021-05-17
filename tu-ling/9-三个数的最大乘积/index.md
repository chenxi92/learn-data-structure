#### 三个数的最大乘积 

整型数组 nums ，在数组中找出由三个数字组成的最大乘积，并输出这个乘积。

乘积不会越界。



##### 解题思路

假设全部为正数， 则最大的三个数为最大乘积；

假设全部为负数， 则最大的三个数为最大乘积；

假设有3个负数， 则最大的三个数为最大乘积；

假设有2个负数， 则最小的两个数和最大的一个数为最大乘积；

假设有1个负数， 则最大的三个数为最大乘积；

因此只需要找出最小的2个数 和 最大的3个数即可。



##### 代码

```python
# coding: utf-8
import sys


def getMax(nums):
    max1 = -sys.maxint - 1
    max2 = -sys.maxint - 1
    max3 = -sys.maxint - 1
    min1 = sys.maxint
    min2 = sys.maxint
    for x in nums:
        if x < min1:
            min2 = min1
            min1 = x
        elif x < min2:
            min2 = x

        if x > max1:
            max3 = max2
            max2 = max1
            max1 = x
        elif x > max2:
            max2 = max1
            max1 = x
        elif x > max3:
            max3 = x
    return max(min1 * min2 * max1, max1 * max2 * max3)


print getMax([-1, 2, 3, 4, 5, 6])

```

