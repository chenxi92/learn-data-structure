#### 删除数组中的重复项

一个有序数组 nums，原地删除重复出现的元素，使每个元素只出现一次，返回删除之后数组的长度。

> 不能使用额外的空间，必须在原地修改输入的数组并在使用O(1)额外空间的条件下完成。



##### 解题思路

采用双指针算法:

- 数组有序，可以用 i 和 j 来代表两个快慢指针；
- nums[i] = nums[j] 时跳过 j；
- nums[i] != nums[j] 时，把 nuns[j] 的值赋值到 i 的后一位，同时增加i；
- 重复运行，知道 j 到达数组末尾；



##### 代码

```python
# coding: utf-8


def removeDuplicates(nums):
    if len(nums) == 0:
        return 0
    i = 0
    for j in range(1, len(nums)):
        if nums[j] != nums[i]:
            i += 1
            nums[i] = nums[j]
    return i + 1


nums = [1, 2, 2, 3, 5, 5, 6]
print removeDuplicates(nums)
```

