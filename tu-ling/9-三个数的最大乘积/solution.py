# coding: utf-8
import sys


def getMax(nums):
    max1 = -sys.maxint - 1
    max2 = -sys.maxint - 1
    max3 = -sys.maxint - 1
    min1 = sys.maxint
    min2 = sys.maxint
    for x in nums:
        if x < min1:
            min2 = min1
            min1 = x
        elif x < min2:
            min2 = x

        if x > max1:
            max3 = max2
            max2 = max1
            max1 = x
        elif x > max2:
            max2 = max1
            max1 = x
        elif x > max3:
            max3 = x
    return max(min1 * min2 * max1, max1 * max2 * max3)


print getMax([-1, 2, 3, 4, 5, 6])
