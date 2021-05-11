#### 最长连续递增序列

>  给定一个未经排序的整数数组，找到最长且连续递增的子序列， 并返回该序列的长度。



##### 解题思路

使用贪婪算法，每次找到一个最长子序列，然后返回最大长度；

每次出现非递增子序列时更新起始位置的值；



##### 代码

```python
class Solution:
    def findLength(self, nums):
        start = 0
        maxLength = 0
        for i in range(1, len(nums)):
            if nums[i] <= nums[i - 1]:
                start = i
            maxLength = max(maxLength, i - start + 1)
        return maxLength
```

