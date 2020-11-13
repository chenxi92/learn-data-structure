# coding: utf-8
import random

def random_list(min, max, count):
    array = []
    while len(array) < count:
        value = random.randint(min, max)
        if value not in array:
            array.append(value)
    return array

def list_is_ascend(list):
    if len(list) < 2:
        return True
    for i in range(1, len(list)):
        if list[i - 1] > list[i]:
            return False
    return True

def list_is_descend(list):
    if len(list) < 2:
        return True
    for i in range(1, len(list)):
        if list[i - 1] < list[i]:
            return False
    return True