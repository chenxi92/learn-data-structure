import Foundation

/**
 https://leetcode.com/problems/container-with-most-water/
 
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

Notice that you may not slant the container.
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var water = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            water = max(water, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return water
    }
}

print(Solution().maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))
print(Solution().maxArea([4,3,2,1,4]))
print(Solution().maxArea([1, 2, 3]))
