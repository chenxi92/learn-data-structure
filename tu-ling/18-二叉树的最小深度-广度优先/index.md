#### 二叉树的最小深度-广度优先

给定一个二叉树，找出其最小深度。

最小深度是从根节点到最近叶子节点的最短路径上的节点数量。



##### 解题思路

###### 广度优先

使用队列（先入先出），把当前节点 接入到 队列中， 如果当前节点是叶子节点，则返回该节点的深度值；

否则把当前节点的 左/右节点（如果不为空） 加入到队列中等待下次遍历。



##### 代码

```python
# coding: utf-8


class TreeNode(object):
    def __init__(self, val, left, right):
        super(TreeNode, self).__init__()
        self.val = val
        self.left = left
        self.right = right
        self.deep = 0


def minDepth(root):
    if root is None:
        return 0
    queue = []
    queue.append(root)
    root.deep = 1
    while root.left > 0:
        node = queue.pop()
        if node.left is None and node.right is None:
            return node.deep
        if node.left is not None:
            node.left.deep = node.deep + 1
            queue.insert(0, node.left)
        if node.right is not None:
            node.right.deep = node.deep + 1
            queue.insert(0, node.right)
    return 0


node7 = TreeNode(7, None, None)
ndoe6 = TreeNode(6, node7, None)
node5 = TreeNode(5, None, None)
node4 = TreeNode(4, None, None)
node3 = TreeNode(3, ndoe6, None)
node2 = TreeNode(2, node4, node5)
node1 = TreeNode(1, node2, node3)
print minDepth(node1)

```

