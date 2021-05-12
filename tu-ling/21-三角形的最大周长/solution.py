# coding: utf-8


def largestPerimeter(nums):
    nums.sort()
    i = len(nums) - 1
    while i >= 2:
        if nums[i - 1] + nums[i - 2] > nums[i]:
            return nums[i - 1] + nums[i - 2] + nums[i]
        i -= 1
    return 0


nums = [3, 6, 2, 2]
print largestPerimeter(nums)
