# coding: utf-8

# https://leetcode.com/problems/merge-intervals/
# Given an array of intervals where intervals[i] = [starti, endi],
# merge all overlapping intervals, and return an array of the
# non-overlapping intervals that cover all the intervals in the input.


class Solution(object):
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """
        intervals.sort(key=lambda x: x[0])
        ans = []
        for array in intervals:
            # left
            if len(ans) == 0 or ans[-1][1] < array[0]:
                ans.append(array)
            # right
            elif ans[-1][0] > array[1]:
                ans.append(array)
            else:
                ans[-1][0] = min(ans[-1][0], array[0])
                ans[-1][1] = max(ans[-1][1], array[1])
        return ans


intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
intervals = [[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]]
print Solution().merge(intervals)
