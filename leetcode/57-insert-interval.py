# coding: utf-8

# https://leetcode.com/problems/insert-interval/
# Given a set of non-overlapping intervals, insert a new interval into the
# intervals (merge if necessary). You may assume that the intervals
# were initially sorted according to their start times.

# Constraints:

# 0 <= intervals.length <= 104
# intervals[i].length == 2
# 0 <= intervals[i][0] <= intervals[i][1] <= 105
# intervals is sorted by intervals[i][0] in ascending order.
# newInterval.length == 2
# 0 <= newInterval[0] <= newInterval[1] <= 105

class Solution(object):
    def insert(self, intervals, newInterval):
        """
        :type intervals: List[List[int]]
        :type newInterval: List[int]
        :rtype: List[List[int]]
        """
        left = newInterval[0]
        right = newInterval[1]
        ans = []
        visit = False
        for item in intervals:
            if item[1] < left:
                ans.append(item)
            elif item[0] > right:
                if not visit:
                    ans.append([left, right])
                    visit = True
                ans.append(item)
            else:
                left = min(item[0], left)
                right = max(item[1], right)
        if not visit:
            ans.append([left, right])
            visit = True
        return ans


intervals = [[1, 3], [6, 9]]
newInterval = [11, 15]
print Solution().insert(intervals, newInterval)
