### 斐波那契数列



<p align="right">2021-5-7</p>



> 求取斐波那契数列的第N位值。

> 斐波那契数列：每一位的值等于他前面两位数字之和， 前两位固定位 0， 1。
>
> 0， 1， 1， 2， 3， 5， 8，  13， 21， 34， 55 ...



#### 暴力递归

根据数据特性每一个数都由前两个数字相加组成，依次往后递归。

```python
def calculate1(num):
    if num == 0:
        return 0
    if num == 1:
        return 1
    return calculate1(num - 1) + calculate1(num - 2)
```

时间复杂度：2^n

空间复杂度：O(1)





#### 去重递归

在暴力递归的基础上记录每个位置值，减少递归次数。

```python
def calculate2(num):
    array = [0 for _ in range(num + 1)]
    return _recurse(array, num)


def _recurse(array, num):
    if num == 0:
        return 0
    if num == 1:
        return 1
    if array[num] != 0:
        return array[num]
    return _recurse(array, num - 1) + _recurse(array, num - 2)

```

时间复杂度：O(n)

空间复杂度：O(n)



#### 双指针

使用两个变量来代替前两个数字

```python
def calculate3(num):
    if num == 0:
        return 0
    if num == 1:
        return 1
    low = 0
    high = 1
    for _ in range(2, num + 1):
        sum = low + high
        low = high
        high = sum
    return high
```

时间复杂度：O(n)

空间复杂度：O(1)