/**
 https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
 
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.
 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return buildBST(nums: nums, low: 0, high: nums.count - 1)
    }
    
    private func buildBST(nums: [Int], low: Int, high: Int) -> TreeNode? {
        if low > high {
            return nil
        }
        let mid = low + (high - low) / 2
        let node = TreeNode(nums[mid])
        node.left = buildBST(nums: nums, low: low, high: mid - 1)
        node.right = buildBST(nums: nums, low: mid + 1, high: high)
        return node
    }
}

let nums = [-10, -3, 0, 5, 9]
print(Solution().sortedArrayToBST(nums) ?? "")
