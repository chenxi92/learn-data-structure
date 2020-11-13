# coding: utf-8

def bubble_sort(array):
    for i in range(len(array)):
        ordered = True
        end = len(array) - i - 1
        for j in range(end):
            if j + 1 < len(array) and array[j] > array[j + 1]:
                (array[j], array[j + 1]) = (array[j + 1], array[j])
                ordered = False
        if ordered is True:
            break
    return array

def selection_sort(array):
    for i in range(len(array)):
        min = i
        for j in range(i, len(array)):
            if array[j] < array[min]:
                min = j
        if i != min:
            (array[i], array[min]) = (array[min], array[i])
    return array

def insertion_sort(array):
    if (len(array) < 1):
        return array
    for i in range(1, len(array)):
        end = i
        for i in range(end):
            if (i < end) and array[end] < array[i]:
                (array[i], array[end]) = (array[end], array[i])
    return array

def shell_sort(array):
    count = len(array)
    if count < 1:
        return array
    gap = count/2
    while gap > 0:
        for i in range(count):
            begin = i
            while (begin >= gap) and (array[begin - gap] > array[begin]):
                (array[begin - gap], array[begin]) = (array[begin], array[begin - gap])
                begin -= gap
        gap /= 2
    return array

def heap_sort(array):
    build_heap(array)
    size = len(array)
    while size > 0:
        size -= 1
        (array[0], array[size]) = (array[size], array[0])
        heap_shift(array, 0, size)
    return array

def build_heap(array):
    n = len(array)/2 - 1
    for i in range(n, -1, -1):
        heap_shift(array, i, len(array))

def heap_shift(array, i, size):
    # 最小堆
    leftChild = 2*i + 1
    rightChild = leftChild + 1
    first = i
    if leftChild < size and array[leftChild] < array[first]:
        first = leftChild
    if rightChild < size and array[rightChild] < array[first]:
        first = rightChild
    if first != i:
        (array[i], array[first]) = (array[first], array[i])
        heap_shift(array, first, size)

def merge_sort(array):
    merge_up_to_down(array, 0, len(array) - 1)
    return array

def merge_up_to_down(array, low, high):
    if (high <= low):
        return
    mid = low + (high - low) / 2
    merge_up_to_down(array, low, mid)
    merge_up_to_down(array, mid + 1, high)
    merge(array, low, mid, high)

def merge_down_to_up(array):
    size = 1
    while size < len(array):
        end = len(array) - size
        low = 0
        while low < end:
            high = min(low + size + size - 1, len(array) - 1)
            mid = (low + size) - 1
            merge(array, low, mid, high)
            low += size + size
        size += size
    return array

def merge(array, low, mid, high):
    left = low
    right = mid + 1
    # copy array
    aux = array[0 : high + 1]
    for i in range(low, high + 1):
        if left > mid:
            array[i] = aux[right]
            right += 1
        elif right > high:
            array[i] = aux[left]
            left += 1
        elif aux[left] > aux[right]:
            array[i] = aux[right]
            right += 1
        else:
            array[i] = aux[left]
            left += 1

