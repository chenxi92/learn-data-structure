# coding: utf-8


def solution(nums, target):
    for i in range(len(nums)):
        low = i
        high = len(nums) - 1
        while low <= high:
            mid = low + (high - low) / 2
            if nums[i] + nums[mid] == target:
                return [i, mid]
            elif nums[i] + nums[mid] > target:
                high = mid - 1
            else:
                low = mid + 1
    return [-1, -1]


def twoPointer(nums, target):
    low = 0
    high = len(nums) - 1
    while low < high:
        if nums[low] + nums[high] == target:
            return [low, high]
        elif nums[low] + nums[high] > target:
            high -= 1
        else:
            low += 1
    return [-1, -1]


nums = [1, 2, 3, 4, 5, 6]
target = 8
print solution(nums, target)
print twoPointer(nums, target)
