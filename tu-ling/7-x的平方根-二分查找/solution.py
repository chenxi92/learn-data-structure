# coding: utf-8


def binarySearch(x):
    index = -1
    left = 0
    right = x
    while left <= right:
        mid = left + (right - left) / 2
        if mid * mid <= x:
            index = mid
            left = mid + 1
        else:
            right = mid - 1
    return index


print binarySearch(24)
