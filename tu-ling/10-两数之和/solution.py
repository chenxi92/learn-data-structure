# coding: utf-8


def solution(nums, target):
    map = {}
    for i in range(len(nums)):
        num = nums[i]
        if map.has_key(target - num):
            return [i, map[target - num]]
        else:
            map[num] = i
    return [-1, -1]


print solution([1, 2, 3, 4, 5, 6], 9)
