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

def quick_sort(array):
    partition(array, 0, len(array) - 1)
    return array

def partition(array, low, high):
    """
    array: 待排序数组
    low:   待排序数组起始坐标
    high:  待排序数组结束坐标
    """

    if (low >= high):
        return
    l = low # 记录从前往后的扫描位置
    r = high # 记录从后往前的扫描位置
    pivot = array[l] # 基准值，选择待排序区间的第一个元素
    # 每一轮, 先从后往前扫，在从前往后扫
    while (l < r):
        while (l < r and array[r] >= pivot):
            r -= 1
        if (l < r):
            array[l] = array[r]
            l += 1
        while (l < r and array[l] <= pivot):
            l += 1
        if (l < r):
            array[r] = array[l]
            r -= 1
    
    # 将基准值放入数组的l位
    array[l] = pivot
    # print l, array
    partition(array, low, l - 1)
    partition(array, l + 1, high)

def quick_sort_lomuto(array):
    partitionLomuto(array, 0, len(array) - 1)
    return array

def partitionLomuto(array, low, high):
    if low >= high:
        return
    index = low
    pivot = array[high]
    for j in range(low, high):
        if array[j] <= pivot:
            if (j != index):
                array[j] , array[index] = (array[index], array[j])
            index += 1
    (array[index], array[high]) = (array[high], array[index])
    partitionLomuto(array, low, index - 1)
    partitionLomuto(array, index + 1, high)

def counting_sort(array):
    # find max value
    max = array[0]
    for element in array:
        if element > max:
            max = element
    
    # initialized the countsArray
    countsArray = []
    for _ in range(0, max + 1):
        countsArray.append(0)

    # calculate counts number and set value to countsArray
    for element in array:
        countsArray[element] += 1
    
    index = 0
    for i in range(0, len(countsArray)):
        value = countsArray[i]
        while value > 0:
            array[index] = i
            index += 1
            value -= 1
    return array

def radix_sort(array):
    max = array[0]
    for element in array:
        if element > max:
            max = element
    
    divider = 1
    while divider <= max:
        array = _counting_sort(divider, array)
        divider *= 10
    return array

def _counting_sort(divider, array):
    # inititalized counts array
    countsArray = []
    for _ in range(0, 10):
        countsArray.append(0)
    
    for element in array:
        # caculate radix
        # 598 / 1 % 10 = 8
        # 598 / 10 % 10 = 9
        # 598 / 100 % 10 = 5
        index = element / divider % 10
        countsArray[index] += 1
    
    # sum the counts
    for i in range(1, len(countsArray)):
        countsArray[i] += countsArray[i - 1]

    newArray = []
    for _ in range(0, len(array)):
        newArray.append(0)

    i = len(array) - 1
    while i >= 0:
        index = array[i] / divider % 10
        countsArray[index] -= 1
        newArray[countsArray[index]]= array[i]
        i -= 1

    for index in range(0, len(array)):
        array[index] = newArray[index]
    return array

# source = [126, 69, 593, 23, 6, 89, 54, 8]
# print source
# print radix_sort(source)