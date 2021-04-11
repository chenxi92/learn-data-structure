import UIKit

/**
 # https://leetcode.com/problems/path-sum/
 # Given the root of a binary tree and an integer targetSum, return true
 # if the tree has a root-to-leaf path such that adding up all the values
 # along the path equals targetSum. A leaf is a node with no children.

 # Constraints:
 # The number of nodes in the tree is in the range [0, 5000].
 # -1000 <= Node.val <= 1000
 # -1000 <= targetSum <= 1000

 # Definition for a binary tree node.
 */


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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root === nil {
            return false
        }
        if root?.left === nil && root?.right === nil && root!.val == targetSum {
            return true
        }
        return hasPathSum(root?.left, targetSum - root!.val) || hasPathSum(root?.right, targetSum - root!.val)
    }
}

let root = TreeNode(1, TreeNode(2), TreeNode(3))
print(Solution().hasPathSum(root, 5))
