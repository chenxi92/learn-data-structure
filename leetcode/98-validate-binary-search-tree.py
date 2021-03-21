# coding:utf-8

# Definition for a binary tree node.


class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        def verify(root, low, high):
            if root is None:
                return True
            if root.val <= low or root.val >= high:
                return False
            return verify(root.left, low, root.val) and verify(root.right, root.val, high)

        return verify(root, float("-inf"), float("inf"))
