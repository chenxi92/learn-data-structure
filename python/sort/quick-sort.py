# coding: utf-8

import tool
import time


def partition(array, low, high):
    right = high
    left = low
    pivot = array[low]
    while left < right:
        while left < right and array[right] >= pivot:
            right -= 1
        if left < right:
            array[left] = array[right]
            left += 1
        while left < right and array[left] <= pivot:
            left += 1
        if left < right:
            array[right] = array[left]
            right -= 1
    array[left] = pivot
    return left


def quickSort1(array, low, high):
    if low >= high:
        return
    pivitIndex = partition(array, low, high)
    quickSort1(array, low, pivitIndex - 1)
    quickSort1(array, pivitIndex + 1, high)


def quickSort2(array, low, high):
    while low < high:
        pivitIndex = partition(array, low, high)
        quickSort1(array, pivitIndex + 1, high)
        high = pivitIndex - 1


def selectValue(array, left, right):
    mid = (left + right) / 2
    if array[left] > array[mid]:
        array[left], array[mid] = array[mid], array[left]
    if array[left] > array[right]:
        array[left], array[right] = array[right], array[left]
    if array[mid] > array[right]:
        array[mid], array[right] = array[right], array[mid]
    return array[mid]


def quickSort3(array, left, right):
    if left >= right:
        return
    x = left
    y = right
    z = selectValue(array, left, right)
    while x <= y:
        while array[x] < z:
            x += 1
        while array[y] > z:
            y -= 1
        if x <= y:
            array[x], array[y] = array[y], array[x]
            x += 1
            y -= 1
    quickSort3(array, left, y)
    quickSort3(array, x, right)


def quickSort4(array, left, right):
    while left < right:
        x = left
        y = right
        z = selectValue(array, left, right)
        while x <= y:
            while array[x] < z:
                x += 1
            while array[y] > z:
                y -= 1
            if x <= y:
                array[x], array[y] = array[y], array[x]
                x += 1
                y -= 1
        quickSort4(array, x, right)
        right = y


def test_one():
    maleftValue = 9999999
    length = 100000
    array = tool.random_list(0, maleftValue, length, False)
    array1 = array[:]
    array2 = array[:]
    array3 = array[:]
    array4 = array[:]
    left = 0
    right = len(array) - 1
    # print array

    b1 = time.time()
    quickSort1(array1, left, right)
    e1 = time.time()
    if tool.list_is_ascend(array1) is False:
        print "\nsort-1 error"
    else:
        print "\nsort-1 OK! time = {}".format(e1 - b1)

    b2 = time.time()
    quickSort2(array2, left, right)
    e2 = time.time()
    if tool.list_is_ascend(array2) is False:
        print "sort-2 error"
    else:
        print "sort-2 OK! time = {}".format(e2 - b2)

    b3 = time.time()
    quickSort3(array3, left, right)
    e3 = time.time()
    if tool.list_is_ascend(array3) is False:
        print "sort-3 error: ", array3
    else:
        print "sort-3 OK! time = {}".format(e3 - b3)

    b4 = time.time()
    quickSort4(array4, left, right)
    e4 = time.time()
    if tool.list_is_ascend(array4) is False:
        print "sort-4 error: ", array4
    else:
        print "sort-4 OK! time = {}".format(e4 - b4)


for _ in range(10):
    test_one()

# array = [15, 8, 9, 13, 1, 4, 13, 12, 4, 11, 4, 0, 0, 3, 12]
# array = [1, 4, 1, 4, 5]
# array = [7, 8, 0, 12, 6, 15, 8, 6, 12, 13, 9, 4, 2, 12, 15]
# array = [8, 12, 9, 12]
# print "before: ", array
# quickSort3(array, 0, len(array) - 1)
# print " after: ", array
