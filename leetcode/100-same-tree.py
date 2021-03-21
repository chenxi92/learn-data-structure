# coding: utf-8

# Given the roots of two binary trees p and q,
# write a function to check if they are the same or not.
# Two binary trees are considered the same if they are
# structurally identical, and the nodes have the same value.

# Constraints:
# The number of nodes in both trees is in the range [0, 100].
# -104 <= Node.val <= 104


class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution(object):
    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """
        if p is None and q is None:
            return True
        if p is None or q is None:
            return False
        if p.val != q.val:
            return False
        isSameLeft = self.isSameTree(p.left, q.left)
        isSameRight = self.isSameTree(p.right, q.right)
        return isSameLeft and isSameRight


p = TreeNode(1, TreeNode(2), TreeNode(3))
q = TreeNode(1, TreeNode(4), TreeNode(3))
print Solution().isSameTree(p, q)
