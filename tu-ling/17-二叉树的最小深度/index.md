#### 二叉树的最小深度

给定一个二叉树，找出其最小深度。

最小深度是从根节点到最近叶子节点的最短路径上的节点数量。



##### 解题思路

###### 深度优先

找到所有的叶子节点（最小深度为1），从叶子节点开始往上找每个节点的最小深度。

当前节点的最小深度为当前节点的 左节点 和 右节点 的最小深度 加 1。



##### 代码

```python
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
    # 叶子节点
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

```

