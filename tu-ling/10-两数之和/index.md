#### 两数之和

给定一个整数数组 nums， 从数组中找出两个数满足相加之和等于目标数 target。

假设每个输入只对应唯一的答案，而且不可以重复使用相同的元素。

放回两数的下标，以数组形式返回。



##### 解题思路

使用一个字典来降低时间复杂度。

字典存储数字和对应的下标， 只需要遍历一遍数组即可找出结果。



##### 代码

```python
# coding: utf-8


def solution(nums, target):
    map = {}
    for i in range(len(nums)):
        num = nums[i]
        if map.has_key(target - num):
            return [i, map[target - num]]
        else:
            map[num] = i
    return [-1, -1]


print solution([1, 2, 3, 4, 5, 6], 9)

```

