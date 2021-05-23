#### 子数组最大平均数

给一个整数数组，找出平均数最大且长度为k的下标连续的子数组，并输出该最大平均数。

输入：[1, 12, -5, -6, 50, 3], k = 4

输出：12.75

最大平均数 ( 12 - 5 - 6 + 50) / 4 = 12.75



##### 解题思路

###### 滑动窗口

计算第一个 k 个元素的加和， 然后从 k 开始依次向前移动窗口，记录当前窗口加和 与之前窗口加和的最大值。

遍历完成则可找打k个元素的最大加和， 结果除以 k 即为平均数。

时间复杂度：O(N)

空间复杂度：O(1)



##### 代码

```python
# coding: utf-8


def findMaxAverage(nums, k):
    n = len(nums)
    if k > n:
        return 0
    # first slid window
    sum = 0
    for i in range(k):
        sum += nums[i]
    maxSum = 0
    for i in range(k, n):
        sum = sum - nums[i - k] + nums[i]
        maxSum = max(sum, maxSum)
    return float(maxSum) / k


nums = [1, 12, -5, -6, 50, 3]
print findMaxAverage(nums, 4)

```

