# coding: utf-8

def twoSum(nums, target):
    map = {}
    for (i, v) in enumerate(nums):
        if map.has_key(target - v):
            return [i, map[target - v]]
        map[v] = i
    return [-1, -1]


print twoSum([2, 7, 11, 15], 9)
