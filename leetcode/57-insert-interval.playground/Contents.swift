import Foundation

/**
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
 */


class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var left = newInterval[0]
        var right = newInterval[1]
        var visited = false
        for item in intervals {
            if item[1] < left {
                ans.append(item)
            } else if item[0] > right {
                if !visited {
                    ans.append([left, right])
                    visited = true
                }
                ans.append(item)
            } else {
                left = min(left, item[0])
                right = max(right, item[1])
            }
        }
        if !visited {
            ans.append([left, right])
            visited = true
        }
        return ans
    }
}

let intervals = [[1, 3], [6, 9]]
let newInterval = [2, 15]
print(Solution().insert(intervals, newInterval))

