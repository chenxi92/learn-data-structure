/**
 https://leetcode.com/problems/largest-rectangle-in-histogram/
 
 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.
 */
import Foundation

class Solution {
    /// Violent solution
    /// traverse the width: left -> right
    func largestRectangleArea1(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        
        var maxArea: Int = 0
        let n = heights.count
        
        for l in 0..<n {
            var minHeight = Int.max
            for r in l..<n {
                minHeight = min(minHeight, heights[r])
                maxArea = max(maxArea, (r - l + 1) * minHeight)
            }
        }
        return maxArea
    }
    
    /// Violent solution
    /// traverse the height:  left <- middle -> rigth
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        
        var maxArea = 0
        let n = heights.count
        for i in 0..<n {
            let height = heights[i]
            var left = i
            var right = i
            while left - 1 >= 0 && heights[left - 1] >= height {
                left -= 1
            }
            while right + 1 < n && heights[right + 1] >= height {
                right += 1
            }
            maxArea = max(maxArea, (right - left + 1) * height)
        }
        return maxArea
    }
    
    /// Use mono stack solution
    func largestRectangleArea3(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        
        let n = heights.count
        // store the left border
        var left: [Int] = Array(repeating: 0, count: n)
        // store the right border
        var right: [Int] = Array(repeating: 0, count: n)
        var stack: [Int] = []
        
        for i in 0..<n {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                stack.removeLast()
            }
            // use -1 as the sentry
            left[i] = stack.isEmpty ? -1 : stack.last!
            stack.append(i)
        }
        
        stack.removeAll()
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                stack.removeLast()
            }
            // use n as the sentry
            right[i] = stack.isEmpty ? n : stack.last!
            stack.append(i)
        }

        var maxArea = 0
        for i in 0..<n {
            let width = right[i] - left[i] - 1
            let heigh = heights[i]
            maxArea = max(maxArea, width * heigh)
        }
        return maxArea
    }
    
    func largestRectangleArea4(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        
        let n = heights.count
        // store the left border
        var left: [Int] = Array(repeating: 0, count: n)
        // store the right border
        var right: [Int] = Array(repeating: n, count: n)
        var stack: [Int] = []
        
        for i in 0..<n {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                right[stack.last!] = i
                stack.removeLast()
            }
            left[i] = stack.isEmpty ? -1 : stack.last!
            stack.append(i)
        }
        
        var maxArea = 0
        for i in 0..<n {
            let width = right[i] - left[i] - 1
            let heigh = heights[i]
            maxArea = max(maxArea, width * heigh)
        }
        return maxArea
    }
    
    func largestRectangleArea5(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        
        var maxArea = 0
        var stack: [Int] = []
        
        for i in 0...heights.count {
            // traverse from current (i) -> left
            let h = (i == heights.count ? 0 : heights[i])
            
            while !stack.isEmpty && h < heights[stack.last!] {
                let high = heights[stack.removeLast()]
                var width = i
                if !stack.isEmpty {
                    width = i - stack.last! - 1
                }
                maxArea = max(maxArea, high * width)
            }
            stack.append(i)
        }
        return maxArea
    }
}

let array1: [Int] = [2, 1, 5, 6, 2, 3]
let array2: [Int] = [2, 4]
let array3: [Int] = [5, 1]
let array4: [Int] = [1]

assert(Solution().largestRectangleArea1(array1) == 10, "excepted 10")
assert(Solution().largestRectangleArea1(array2) == 4,  "excepted 4")
assert(Solution().largestRectangleArea1(array3) == 5,  "excepted 5")
assert(Solution().largestRectangleArea1(array4) == 1,  "excepted 0")
print("--- finished violent solution 1---\n")

assert(Solution().largestRectangleArea2(array1) == 10, "excepted 10")
assert(Solution().largestRectangleArea2(array2) == 4,  "excepted 4")
assert(Solution().largestRectangleArea2(array3) == 5,  "excepted 5")
assert(Solution().largestRectangleArea2(array4) == 1,  "excepted 0")
print("--- finished violent solution 2---\n")

assert(Solution().largestRectangleArea3(array1) == 10, "excepted 10")
assert(Solution().largestRectangleArea3(array2) == 4,  "excepted 4")
assert(Solution().largestRectangleArea3(array3) == 5,  "excepted 5")
assert(Solution().largestRectangleArea3(array4) == 1,  "excepted 0")
print("--- finished solution with mono stack---\n")

assert(Solution().largestRectangleArea4(array1) == 10, "excepted 10")
assert(Solution().largestRectangleArea4(array2) == 4,  "excepted 4")
assert(Solution().largestRectangleArea4(array3) == 5,  "excepted 5")
assert(Solution().largestRectangleArea4(array4) == 1,  "excepted 0")
print("--- finished solution with stack---\n")

assert(Solution().largestRectangleArea5(array1) == 10, "excepted 10")
assert(Solution().largestRectangleArea5(array2) == 4,  "excepted 4")
assert(Solution().largestRectangleArea5(array3) == 5,  "excepted 5")
assert(Solution().largestRectangleArea5(array4) == 1,  "excepted 0")
print("--- finished solution with stack---\n")
