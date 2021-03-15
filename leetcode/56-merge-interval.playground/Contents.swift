import Foundation

/**
 # https://leetcode.com/problems/merge-intervals/
 # Given an array of intervals where intervals[i] = [starti, endi],
 # merge all overlapping intervals, and return an array of the
 # non-overlapping intervals that cover all the intervals in the input.
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted {
            $0[0] < $1[0]
        }
        var ans: [[Int]] = []
        for item in intervals {
            // left
            if ans.count == 0 || ans[ans.count - 1][1] < item[0] {
                ans.append(item)
            } else if ans[ans.count - 1][0] > item[1] {
                ans.append(item)
            } else {
                ans[ans.count - 1][0] = min(ans[ans.count - 1][0], item[0])
                ans[ans.count - 1][1] = max(ans[ans.count - 1][1], item[1])
            }
        }
        return ans
    }
}

//let intervals = [[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]]
let intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
print(Solution().merge(intervals))
