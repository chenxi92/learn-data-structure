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
