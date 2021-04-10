# coding: utf-8

# https://leetcode.com/problems/path-sum/
# Given the root of a binary tree and an integer targetSum, return true
# if the tree has a root-to-leaf path such that adding up all the values
# along the path equals targetSum. A leaf is a node with no children.

# Constraints:
# The number of nodes in the tree is in the range [0, 5000].
# -1000 <= Node.val <= 1000
# -1000 <= targetSum <= 1000

# Definition for a binary tree node.


class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution(object):
    def hasPathSum(self, root, targetSum):
        """
        :type root: TreeNode
        :type targetSum: int
        :rtype: bool
        """
        if root is None:
            return False
        if root.left is None and root.right is None:
            return root.val == targetSum
        leftValid = self.hasPathSum(root.left, targetSum - root.val)
        rightValid = self.hasPathSum(root.right, targetSum - root.val)
        return leftValid or rightValid


root = TreeNode(1, TreeNode(2), TreeNode(3))
print Solution().hasPathSum(root, 3)
