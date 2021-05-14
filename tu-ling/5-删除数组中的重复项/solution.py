# coding: utf-8


def removeDuplicates(nums):
    if len(nums) == 0:
        return 0
    i = 0
    for j in range(1, len(nums)):
        if nums[j] != nums[i]:
            i += 1
            nums[i] = nums[j]
    return i + 1


nums = [1, 2, 2, 3, 5, 5, 6]
print removeDuplicates(nums)
