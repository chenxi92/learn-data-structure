#### x的平方根-二分查找

在不适用 sqrt(x) 函数的情况下，得到 x 的平方根的整数部分；



##### 解题思路

假设 x 的平方根为 n， 则 `n = x / n`,  且 `x / n`  和 `n` 的均值比他们两个更加趋近于 `n` 。

不断对 n 进行求值，最后得到平方根。

##### 代码

```python
# coding: utf-8


def newton(x):
    return sqrt(x, x)


def sqrt(i, x):
    res = (float)(i + x / i) / 2
    if res == i:
        return int(res)
    else:
        return sqrt(res, x)


print newton(24)

```

