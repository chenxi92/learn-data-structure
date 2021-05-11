# coding: utf-8


def findLength(nums):
    start = 0
    maxLength = 0
    for i in range(1, len(nums)):
        if nums[i] <= nums[i - 1]:
            start = i
        maxLength = max(maxLength, i - start + 1)
    return maxLength


nums = [1, 2, 3, 2, 3, 4, 3, 4, 5, 6, 7]
print findLength(nums)
