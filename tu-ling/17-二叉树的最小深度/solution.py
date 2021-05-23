# coding: utf-8
import sys


class TreeNode(object):
    def __init__(self, val, left, right):
        super(TreeNode, self).__init__()
        self.val = val
        self.left = left
        self.right = right


def minDepth(root):
    if root is None:
        return 0
    if root.left is None and root.right is None:
        return 1
    minValue = sys.maxint
    if root.left is not None:
        minValue = min(minDepth(root.left), minValue)
    if root.right is not None:
        minValue = min(minDepth(root.right), minValue)
    return minValue + 1


node7 = TreeNode(7, None, None)
ndoe6 = TreeNode(6, node7, None)
node5 = TreeNode(5, None, None)
node4 = TreeNode(4, None, None)
node3 = TreeNode(3, ndoe6, None)
node2 = TreeNode(2, node4, node5)
node1 = TreeNode(1, node2, node3)
print minDepth(node1)
