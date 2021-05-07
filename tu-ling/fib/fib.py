#! coding: utf-8

def calculate1(num):
    if num == 0:
        return 0
    if num == 1:
        return 1
    return calculate1(num - 1) + calculate1(num - 2)


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


num = 10
print "calculate1 =", calculate1(num)
print "calculate2 =", calculate2(num)
print "calculate3 =", calculate3(num)
