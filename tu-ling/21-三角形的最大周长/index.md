#### 三角形的最大周长

> 给定一些正数（代表长度）组成的数组，返回由其中3个长度组成的、面积不为零的三角形的最大周长。
>
> 如果不能形成任何面积不为零的三角形，返回 0 。



##### 解题思路

假设三角形的三个边的长度分别为 a，b，c，则它们满足如下条件:

> a + b > c
>
> a < c
>
> b < c

可以把数组排序之后，倒序取出3个数组，看是否满足如上公式；



##### 代码

```python
def largestPerimeter(nums):
    nums.sort()
    i = len(nums) - 1
    while i >= 2:
        if nums[i - 1] + nums[i - 2] > nums[i]:
            return nums[i - 1] + nums[i - 2] + nums[i]
        i -= 1
    return 0


nums = [3, 6, 2, 2]
print largestPerimeter(nums)
```

