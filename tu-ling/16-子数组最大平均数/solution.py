# coding: utf-8


def findMaxAverage(nums, k):
    n = len(nums)
    if k > n:
        return 0
    # first slid window
    sum = 0
    for i in range(k):
        sum += nums[i]
    maxSum = 0
    for i in range(k, n):
        sum = sum - nums[i - k] + nums[i]
        maxSum = max(sum, maxSum)
    return float(maxSum) / k


nums = [1, 12, -5, -6, 50, 3]
print findMaxAverage(nums, 4)
