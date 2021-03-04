求 3 数相加之和， 每次遍历数组中的值得时候， 使用 2 个指针扫描剩下的数组。

对于 k 个数相加之和， 通过嵌套 k-2 个循环来遍历 k-2 个值的所有组合。



#### 算法过程

使用递归来实现 `k-2` 次循环， 起始参数为 `k`， 当 `k==2` 时， 调用 `twoSum` 函数来终止递归

1. 主函数
   - 排序输入的数组 `nums`
     - 调用 `kSum` 函数， 参数传递 `start = 0`, `k = 4` , `target = target`， 然后返回结果
2. `kSum` 函数
   - 因为 `nums` 是有序的， 所以需要检查 `k` 个 `最小值` 是否大于 `target`， 或者 `k` 个 `最大值` 是否小于 `target`
     - 如果满足条件，不需要执行后续操作，直接返回
   - 如果 `k==2`， 调用 `twoSum` 函数，并返回结果
   - 从 `nums` 数组中的 `start` 处遍历数组(i 为当前下标)
     - 如果当前数组中的值和前一个相等，则跳过循环
     - 递归的调用 `kSum` 函数， 传递参数 `start = i + 1`, `k = k -1`, `target = target - nums[i]`
     - 遍历每次返回的二维数组
       - 把当前的值 `nums[i]` 添加到数组中（一维数组）
       - 把当前的一维数组添加结果数组 `res` 中
   - 返回结果数组 `res`
3. `twoSum` 函数
   - 设置 `left` 指针指向 `start`， `right` 指针指向 `end`
   - 当 `left` 小于 `right` 时：
     - 如果两数之和 `nums[left] + nums[right]` 小于 `target`， 增加 `left`
       - `nums[left]` 等于 `nums[left + 1]`，增加 `left`
     - 如果两数之和 `nums[left] + nums[right]` 大于 `target`， 减少 `right`
       - 如果 `nums[right]` 等于 `nums[right + 1]`， 减少 `right`
     - 相等，则表示找到一对符合的结果
       - 添加到 `res` 数组中
       - 增加 `left`， 减少 `right`
   - 返回结果 `res`



#### 代码实现

```python
def fourSum(nums, target):
        def kSum(nums, target, k):
            res = []
            if len(nums) == 0 or (nums[0] * k > target) or (target > nums[-1] * k):
                return res
            if k == 2:
                return twoSum(nums, target)

            for i in range(len(nums)):
                if i == 0 or nums[i - 1] != nums[i]:
                    kSumResult = kSum(nums[i + 1:], target - nums[i], k - 1)
                    for kRes in kSumResult:
                        kRes.insert(0, nums[i])
                        res.append(kRes)
            return res

        def twoSum(nums, target):
            res = []
            left, right = 0, len(nums) - 1
            while left < right:
                sum = nums[left] + nums[right]
                if sum == target:
                    res.append([nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1
                    left += 1
                    right -= 1
                elif sum > target:
                    right -= 1
                else:
                    left += 1
            return res

        nums.sort()
        return kSum(nums, target, 4)
```

