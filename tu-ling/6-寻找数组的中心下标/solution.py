# coding: utf-8


def pivotIndex(nums):
    sum = 0
    for num in nums:
        sum += num
    total = 0
    for i in range(0, len(nums)):
        total += nums[i]
        if total == sum:
            return i
        sum -= nums[i]
    return - 1


nums = [1, 7, 3, 6, 5, 6]
print pivotIndex(nums)
